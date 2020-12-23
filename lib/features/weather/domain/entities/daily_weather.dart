import 'package:equatable/equatable.dart';
import 'package:rock_weather/features/weather/domain/entities/temperature.dart';

class DailyWeather extends Equatable {
  final DateTime dateTime;
  final Temperature temperature;
  final String weatherDescription;
  final String weatherIcon;

  DailyWeather({
    this.dateTime,
    this.temperature,
    this.weatherDescription,
    this.weatherIcon,
  });

  @override
  List<Object> get props => [
        dateTime,
        temperature,
        weatherDescription,
        weatherIcon,
      ];
}
