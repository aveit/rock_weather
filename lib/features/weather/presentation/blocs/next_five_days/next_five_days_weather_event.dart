part of 'next_five_days_weather_bloc.dart';

@freezed
abstract class NextFiveDaysWeatherEvent with _$NextFiveDaysWeatherEvent {
  const factory NextFiveDaysWeatherEvent.getWeatherForNextFiveDaysForCity({
    @required City city,
  }) = _GetWeatherForNextFiveDaysForCity;
}
