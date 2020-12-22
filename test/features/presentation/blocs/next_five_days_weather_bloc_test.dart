import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_next_five_days_weather.dart';
import 'package:rock_weather/features/weather/presentation/blocs/next_five_days/next_five_days_weather_bloc.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:test/test.dart';

class MockGetWeatherForNextFiveDays extends Mock
    implements GetWeatherForNextFiveDays {}

void main() {
  MockGetWeatherForNextFiveDays mockGetWeatherForNextFiveDays;
  NextFiveDaysWeatherBloc nextFiveDaysWeatherBloc;
  setUp(() {
    mockGetWeatherForNextFiveDays = MockGetWeatherForNextFiveDays();
    nextFiveDaysWeatherBloc = NextFiveDaysWeatherBloc(
      getWeatherForNextFiveDays: mockGetWeatherForNextFiveDays,
    );
  });

  group('[WEATHER FOR NEXT FIVE DAYS]', () {
    final city = City(
      countryCode: 'ANY',
      name: 'ANY',
      currentWeather: null,
      nextFiveDaysWeather: null,
      latitude: 1,
      longitude: 1,
    );

    final weatherResult = [
      CurrentWeather(
        dateTime: DateTime.fromMillisecondsSinceEpoch(1608316565),
        clouds: 1,
        dateTimeSunrise: DateTime.fromMillisecondsSinceEpoch(1608316565),
        dateTimeSunset: DateTime.fromMillisecondsSinceEpoch(1608316565),
        feelsLike: 1,
        humidity: 1,
        temp: 1,
        visibility: 1,
        weatherDescription: 'ANY',
        weatherIcon: 'ANY',
        windDeg: 1,
        windSpeed: 1,
      ),
      CurrentWeather(
        dateTime: DateTime.fromMillisecondsSinceEpoch(1608316565),
        clouds: 1,
        dateTimeSunrise: DateTime.fromMillisecondsSinceEpoch(1608316565),
        dateTimeSunset: DateTime.fromMillisecondsSinceEpoch(1608316565),
        feelsLike: 1,
        humidity: 1,
        temp: 1,
        visibility: 1,
        weatherDescription: 'ANY',
        weatherIcon: 'ANY',
        windDeg: 1,
        windSpeed: 1,
      ),
    ];

    final cityWithWeatherLoaded = city.copyWith(
      nextFiveDaysWeather: weatherResult,
    );

    tearDown(() {
      verify(mockGetWeatherForNextFiveDays(
        params: GetWeatherForNextFiveDaysParams(city: city),
      ));
    });

    blocTest(
      'Should emit [loading, loaded] when success',
      build: () {
        when(mockGetWeatherForNextFiveDays(params: anyNamed('params')))
            .thenAnswer(
          (_) async => Right(weatherResult),
        );
        return nextFiveDaysWeatherBloc;
      },
      act: (bloc) => bloc.add(
        NextFiveDaysWeatherEvent.getWeatherForNextFiveDaysForCity(city: city),
      ),
      expect: [
        NextFiveDaysWeatherState.loading(),
        NextFiveDaysWeatherState.loaded(cityWithWeatherLoaded),
      ],
    );

    blocTest(
      'Should emit [loading, error] when unsuccessfull',
      build: () {
        when(mockGetWeatherForNextFiveDays(params: anyNamed('params')))
            .thenAnswer(
          (_) async => Left(ServerFailure()),
        );
        return nextFiveDaysWeatherBloc;
      },
      act: (bloc) => bloc.add(
        NextFiveDaysWeatherEvent.getWeatherForNextFiveDaysForCity(city: city),
      ),
      expect: [
        NextFiveDaysWeatherState.loading(),
        NextFiveDaysWeatherState.error(error: 'Error to get Weather'),
      ],
    );
  });
}
