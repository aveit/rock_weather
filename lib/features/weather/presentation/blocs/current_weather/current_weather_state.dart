part of 'current_weather_bloc.dart';

@freezed
abstract class CurrentWeatherState with _$CurrentWeatherState {
  const factory CurrentWeatherState.initial() = _Initial;
  const factory CurrentWeatherState.loading() = _Loading;
  const factory CurrentWeatherState.error() = _Error;
  const factory CurrentWeatherState.loaded(City cityWithCurrentWeatherLoaded) =
      _Loaded;
}
