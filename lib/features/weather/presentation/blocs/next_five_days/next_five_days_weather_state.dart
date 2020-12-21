part of 'next_five_days_weather_bloc.dart';

@freezed
abstract class NextFiveDaysWeatherState with _$NextFiveDaysWeatherState {
  const factory NextFiveDaysWeatherState.initial() = _Initial;
  const factory NextFiveDaysWeatherState.loading() = _Loading;
  const factory NextFiveDaysWeatherState.error() = _Error;
  const factory NextFiveDaysWeatherState.loaded(City cityWithLoadedWeather) =
      _Loaded;
}
