import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:rock_weather/features/weather/data/repositories/weather_repository_implementation.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/shared/errors/exceptions.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:rock_weather/shared/network/network_info.dart';
import 'package:test/test.dart';

class MockWeatherRemoteDataSouce extends Mock
    implements WeatherRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  WeatherRepositoryImplementation weatherRepository;
  MockWeatherRemoteDataSouce mockWeatherRemoteDataSouce;
  MockNetworkInfo mockNetworkInfo;

  final city = City(name: 'Brasilia', stateCode: 'DF', countryCode: 'BR');

  setUp(() {
    mockWeatherRemoteDataSouce = MockWeatherRemoteDataSouce();
    mockNetworkInfo = MockNetworkInfo();

    weatherRepository = WeatherRepositoryImplementation(
      remoteDataSource: mockWeatherRemoteDataSouce,
      networkInfo: mockNetworkInfo,
    );
  });

  void mockOnline() =>
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

  void mockOffline() =>
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

  tearDown(() {
    verify(mockNetworkInfo.isConnected);
  });

  group('[WEATHER FOR NEXT FIVE DAYS]', () {
    group('[OFFLINE]', () {
      setUp(() {
        mockOffline();
      });

      test('Should return Left with ServerFailure when there is no connection',
          () async {
        //* Act
        final result = await weatherRepository.getWeatherForNextFiveDaysForCity(
            city: city);
        //! Assert
        expect(
          result,
          Left(
            ServerFailure(
              errorTitle: 'Not connected',
              errorMessage: 'Please verify your network connection.',
            ),
          ),
        );
      });
    });
    group('[ONLINE]', () {
      setUp(() {
        mockOnline();
      });

      test('Should call remote datasource to get data', () async {
        //* Act
        await weatherRepository.getWeatherForNextFiveDaysForCity(city: city);
        //! Assert
        verify(mockWeatherRemoteDataSouce.getWeatherForNextFiveDaysForCity(
            city: city));
      });

      test('Should return the list of weather when everything is ok', () async {
        final weathers = [
          Weather(
            dateTime: DateTime.fromMillisecondsSinceEpoch(1608230106),
            currentTemperature: 20.1,
            feelsLike: 25.2,
            minimumTemperature: 18.6,
            maximumTemperature: 22.5,
          ),
          Weather(
            dateTime: DateTime.fromMillisecondsSinceEpoch(1608316565),
            currentTemperature: 30.1,
            feelsLike: 35.2,
            minimumTemperature: 28.6,
            maximumTemperature: 32.5,
          ),
        ];
        when(mockWeatherRemoteDataSouce.getWeatherForNextFiveDaysForCity(
          city: anyNamed('city'),
        )).thenAnswer((_) async => weathers);

        //* Act
        final result = await weatherRepository.getWeatherForNextFiveDaysForCity(
            city: city);

        //! Assert
        expect(result, Right(weathers));
      });

      test(
          'Should return Left with ServerFailure when something goes wrong on the datasource',
          () async {
        when(mockWeatherRemoteDataSouce.getWeatherForNextFiveDaysForCity(
          city: anyNamed('city'),
        )).thenThrow(ServerException());

        //* Act
        final result = await weatherRepository.getWeatherForNextFiveDaysForCity(
            city: city);

        //! Assert
        expect(result, Left(ServerFailure()));
      });
    });
  });

  group('[CURRENT WEATHER]', () {
    group('[OFFLINE]', () {
      setUp(() {
        mockOffline();
      });

      test('Should return Left with ServerFailure when there is no connection',
          () async {
        //* Act
        final result =
            await weatherRepository.getCurrentWeatherForCity(city: city);
        //! Assert
        expect(
          result,
          Left(
            ServerFailure(
              errorTitle: 'Not connected',
              errorMessage: 'Please verify your network connection.',
            ),
          ),
        );
      });
    });

    group('[ONLINE]', () {
      setUp(() {
        mockOnline();
      });

      test('Should call remote datasource to get data', () async {
        //* Act
        await weatherRepository.getCurrentWeatherForCity(city: city);
        //! Assert
        verify(mockWeatherRemoteDataSouce.getCurrentWeatherForCity(city: city));
      });

      test('Should return the weather when everything is ok', () async {
        final weather = Weather(
          dateTime: DateTime.fromMillisecondsSinceEpoch(1608316565),
          currentTemperature: 30.1,
          feelsLike: 35.2,
          minimumTemperature: 28.6,
          maximumTemperature: 32.5,
        );
        when(mockWeatherRemoteDataSouce.getCurrentWeatherForCity(
          city: anyNamed('city'),
        )).thenAnswer((_) async => weather);

        //* Act
        final result =
            await weatherRepository.getCurrentWeatherForCity(city: city);

        //! Assert
        expect(result, Right(weather));
      });

      test(
          'Should return Left with ServerFailure when something goes wrong on the datasource',
          () async {
        when(mockWeatherRemoteDataSouce.getCurrentWeatherForCity(
          city: anyNamed('city'),
        )).thenThrow(ServerException());

        //* Act
        final result =
            await weatherRepository.getCurrentWeatherForCity(city: city);

        //! Assert
        expect(result, Left(ServerFailure()));
      });
    });
  });
}
