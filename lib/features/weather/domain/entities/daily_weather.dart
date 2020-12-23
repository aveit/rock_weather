import 'package:equatable/equatable.dart';
import 'package:rock_weather/features/weather/domain/entities/temperature.dart';

class DailyWeather extends Equatable {
  final DateTime dateTime;
  final Temperature temperature;
  final int humidity;
  final String weatherDescription;
  final String weatherIcon;
  final num rain;

  DailyWeather({
    this.dateTime,
    this.temperature,
    this.humidity,
    this.weatherDescription,
    this.weatherIcon,
    this.rain,
  });

  @override
  List<Object> get props => [
        dateTime,
        temperature,
        humidity,
        weatherDescription,
        weatherIcon,
        rain,
      ];
}
