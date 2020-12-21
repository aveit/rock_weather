part of 'weather_bloc.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.error() = _Error;
  const factory WeatherState.loaded(Weather weatherResult) = _Loaded;
}
