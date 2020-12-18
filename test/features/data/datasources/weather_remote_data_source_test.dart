import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:rock_weather/features/weather/data/models/weather.dart';
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
    stateCode: 'DF',
    countryCode: 'BR',
  );

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = WeatherRemoteDataSourceImplementation(
      networkClient: mockDio,
    );
  });

  test('Should call Dio with correct values to get data from the API',
      () async {
    //? Arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('weather.json'));
    when(mockDio.get(any)).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: jsonMap,
      ),
    );
    final apiKey = remoteDataSource.apiKey;
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=${city.name},${city.stateCode},${city.countryCode}&appid=$apiKey';

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
    final Map<String, dynamic> jsonMap = json.decode(fixture('weather.json'));
    when(mockDio.get(any)).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: jsonMap,
      ),
    );

    //* Act
    final result = await remoteDataSource.getCurrentWeatherForCity(city: city);

    //! Assert
    expect(
      result,
      WeatherModel.fromJson(jsonMap),
    );
  });
}
