import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:rock_weather/features/weather/domain/entities/daily_weather.dart';
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
      DailyWeather(
        dt: 1608316565,
        sunrise: 1608316565,
        sunset: 1608316565,
        rain: 1,
        humidity: 1,
        feelsLike: FeelsLike(day: 1, eve: 1, morn: 1, night: 1),
        temp: Temp(day: 1, night: 1, morn: 1, eve: 1, max: 1, min: 1),
        weather: [
          Weather(description: 'ANY', icon: 'ANY', id: 1, main: 'ANY'),
        ],
      ),
      DailyWeather(
        dt: 1608316565,
        sunrise: 1608316565,
        sunset: 1608316565,
        rain: 1,
        humidity: 1,
        feelsLike: FeelsLike(day: 1, eve: 1, morn: 1, night: 1),
        temp: Temp(day: 1, night: 1, morn: 1, eve: 1, max: 1, min: 1),
        weather: [
          Weather(description: 'ANY', icon: 'ANY', id: 1, main: 'ANY'),
        ],
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
