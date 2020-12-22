import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  final DateTime dateTime;
  final DateTime dateTimeSunset;
  final DateTime dateTimeSunrise;
  final num temp;
  final num feelsLike;
  final int humidity;
  final int clouds;
  final int visibility;
  final int windSpeed;
  final int windDeg;
  final String weatherDescription;
  final String weatherIcon;

  const CurrentWeather({
    this.dateTime,
    this.dateTimeSunset,
    this.dateTimeSunrise,
    this.temp,
    this.feelsLike,
    this.humidity,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weatherDescription,
    this.weatherIcon,
  });

  @override
  String toString() {
    final stringList = props.map((e) => e.toString()).toList();
    return stringList.join(',');
  }

  @override
  List<Object> get props => [
        dateTime,
        dateTimeSunset,
        dateTimeSunrise,
        temp,
        feelsLike,
        humidity,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        weatherDescription,
        weatherIcon,
      ];
}
