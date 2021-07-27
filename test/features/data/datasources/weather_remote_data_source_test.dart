import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:rock_weather/features/weather/data/models/current_weather_model.dart';
import 'package:rock_weather/features/weather/data/models/daily_weather_model.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/shared/errors/exceptions.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  WeatherRemoteDataSourceImplementation remoteDataSource;
  MockDio mockDio;

  final city = City(
    name: 'Brasilia',
    countryCode: 'BR',
    currentWeather: null,
    nextFiveDaysWeather: null,
    latitude: 1,
    longitude: 1,
  );

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = WeatherRemoteDataSourceImplementation(
      networkClient: mockDio,
    );
  });

  test('codemagic test', () {
    expect(true, false);
  });

  group('[NEXT FIVE DAYS]', () {
    test('Should call Dio with correct values to get data from the API',
        () async {
      //? Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('daily_weather.json'));

      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonMap,
        ),
      );

      final apiKey = remoteDataSource.apiKey;
      final url =
          'onecall?lat=${city.latitude}&lon=${city.longitude}&exclude=current,minutely,hourly,alerts&appid=$apiKey&units=metric';

      //* Act
      await remoteDataSource.getWeatherForNextFiveDaysForCity(city: city);

      //! Assert
      verify(mockDio.get(url));
    });

    test('Should throw a ServerException when there is something wrong in Dio',
        () async {
      //? Arrange
      when(mockDio.get(any)).thenThrow(DioError());

      //* Act
      final call = remoteDataSource.getWeatherForNextFiveDaysForCity;

      //! Assert
      expect(() => call(city: city), throwsA(TypeMatcher<ServerException>()));
    });

    test('Should get the list of Weather', () async {
      //? Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('daily_weather.json'));

      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonMap,
        ),
      );

      //* Act
      final result =
          await remoteDataSource.getWeatherForNextFiveDaysForCity(city: city);

      //! Assert
      var weatherModels = <DailyWeatherModel>[];
      jsonMap['daily'].forEach((json) {
        if (weatherModels.length < 5) {
          weatherModels.add(DailyWeatherModel.fromJson(json));
        }
      });
      expect(weatherModels, result);
    });

    test('Should throw a ServerException if Dio returns empty data', () async {
      //* Act
      final call = remoteDataSource.getWeatherForNextFiveDaysForCity;

      //! Assert
      expect(
        () async => await call(city: city),
        throwsA(
          predicate(
              (e) => e is ServerException && e.errorMessage == 'Nothing found'),
        ),
      );
    });
  });

  group('[CURRENT WEATHER]', () {
    test('Should call Dio with correct values to get data from the API',
        () async {
      //? Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('current_weather.json'));
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: jsonMap,
        ),
      );
      final apiKey = remoteDataSource.apiKey;
      final url =
          'onecall?lat=${city.latitude}&lon=${city.longitude}&exclude=daily,minutely,hourly,alerts&appid=$apiKey&units=metric';

      //* Act
      await remoteDataSource.getCurrentWeatherForCity(city: city);

      //! Assert
      verify(mockDio.get(url));
    });

    test('Should throw a ServerException if Dio returns empty data', () async {
      //* Act
      final call = remoteDataSource.getCurrentWeatherForCity;

      //! Assert
      expect(
        () async => await call(city: city),
        throwsA(
          predicate(
              (e) => e is ServerException && e.errorMessage == 'Nothing found'),
        ),
      );
    });

    test('Should throw a ServerException when there is something wrong in Dio',
        () async {
      //? Arrange
      when(mockDio.get(any)).thenThrow(DioError());

      //* Act
      final call = remoteDataSource.getCurrentWeatherForCity;

      //! Assert
      expect(() => call(city: city), throwsA(TypeMatcher<ServerException>()));
    });

    test('Should get the current Weather', () async {
      //? Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('current_weather.json'));
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: jsonMap,
        ),
      );

      //* Act
      final result =
          await remoteDataSource.getCurrentWeatherForCity(city: city);

      //! Assert
      expect(
        result,
        CurrentWeatherModel.fromJson(jsonMap['current']),
      );
    });
  });
}
