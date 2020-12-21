part of 'weather_bloc.dart';

@freezed
abstract class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.getCurrentWeatherForCity({@required City city}) =
      _GetCurrentWeatherForCity;
}
