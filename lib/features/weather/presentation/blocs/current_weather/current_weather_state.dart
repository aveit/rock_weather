part of 'current_weather_bloc.dart';

@freezed
abstract class CurrentWeatherState with _$CurrentWeatherState {
  const factory CurrentWeatherState({
    bool isLoading,
    String error,
    City loadedCity,
  }) = _CurrentWeatherState;

  factory CurrentWeatherState.initial() => CurrentWeatherState(
        isLoading: false,
        error: '',
        loadedCity: null,
      );

  factory CurrentWeatherState.loading() => CurrentWeatherState(
        isLoading: true,
        error: '',
      );
  factory CurrentWeatherState.error() => CurrentWeatherState(
        isLoading: false,
        error: 'Error',
      );
  factory CurrentWeatherState.loaded(City cityWithCurrentWeatherLoaded) =>
      CurrentWeatherState(
        isLoading: false,
        error: '',
        loadedCity: cityWithCurrentWeatherLoaded,
      );
}
