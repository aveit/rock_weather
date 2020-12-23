import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_current_weather.dart';
import 'package:rock_weather/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:test/test.dart';

class MockGetCurrentWeather extends Mock implements GetWeather {}

void main() {
  MockGetCurrentWeather mockGetCurrentWeather;
  CurrentWeatherBloc weatherBloc;
  setUp(() {
    mockGetCurrentWeather = MockGetCurrentWeather();
    weatherBloc = CurrentWeatherBloc(getCurrentWeather: mockGetCurrentWeather);
  });

  group('[CURRENT WEATHER]', () {
    final city = City(
      countryCode: 'ANY',
      name: 'ANY',
      currentWeather: null,
      nextFiveDaysWeather: null,
      latitude: 1,
      longitude: 1,
    );

    final weatherResult = CurrentWeather(
      dateTime: DateTime.fromMillisecondsSinceEpoch(1608316565),
      feelsLike: 1,
      temp: 1,
      weatherDescription: 'ANY',
      weatherIcon: 'ANY',
    );

    final cityWithCurrentWeatherLoaded = city.copyWith(
      currentWeather: weatherResult,
    );

    tearDown(() {
      verify(mockGetCurrentWeather(params: GetWeatherParams(city: city)));
    });
    blocTest(
      'Should emit [loading, error] when unsuccessful',
      build: () {
        when(mockGetCurrentWeather(params: anyNamed('params')))
            .thenAnswer((_) async => Left(ServerFailure()));
        return weatherBloc;
      },
      act: (bloc) =>
          bloc.add(CurrentWeatherEvent.getCurrentWeatherForCity(city: city)),
      expect: [
        CurrentWeatherState.loading(),
        CurrentWeatherState.error(),
      ],
    );

    blocTest(
      'Should emit [loading, loaded] when success',
      build: () {
        when(mockGetCurrentWeather(params: anyNamed('params'))).thenAnswer(
          (_) async => Right(weatherResult),
        );
        return weatherBloc;
      },
      act: (bloc) =>
          bloc.add(CurrentWeatherEvent.getCurrentWeatherForCity(city: city)),
      expect: [
        CurrentWeatherState.loading(),
        CurrentWeatherState.loaded(cityWithCurrentWeatherLoaded),
      ],
    );
  });
}
