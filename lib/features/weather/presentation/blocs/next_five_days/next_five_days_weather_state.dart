part of 'next_five_days_weather_bloc.dart';

@freezed
abstract class NextFiveDaysWeatherState with _$NextFiveDaysWeatherState {
  const factory NextFiveDaysWeatherState({
    bool isLoading,
    String error,
    City loadedCity,
  }) = _NextFiveDaysWeatherState;

  factory NextFiveDaysWeatherState.initial() => NextFiveDaysWeatherState(
        isLoading: false,
        error: '',
        loadedCity: null,
      );

  factory NextFiveDaysWeatherState.loading() => NextFiveDaysWeatherState(
        isLoading: true,
        error: '',
      );

  factory NextFiveDaysWeatherState.error({String error}) =>
      NextFiveDaysWeatherState(
        isLoading: false,
        error: error ?? 'Error',
      );

  factory NextFiveDaysWeatherState.loaded(City cityWithCurrentWeatherLoaded) =>
      NextFiveDaysWeatherState(
        isLoading: false,
        error: '',
        loadedCity: cityWithCurrentWeatherLoaded,
      );
}
