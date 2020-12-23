import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';

import 'daily_weather.dart';

class City extends Equatable {
  final String name;
  final String countryCode;
  final double latitude;
  final double longitude;
  final CurrentWeather currentWeather;
  final List<DailyWeather> nextFiveDaysWeather;

  City({
    @required this.name,
    @required this.countryCode,
    @required this.latitude,
    @required this.longitude,
    @required this.currentWeather,
    @required this.nextFiveDaysWeather,
  });

  City copyWith({
    String name,
    String countryCode,
    double latitude,
    double longitude,
    CurrentWeather currentWeather,
    List<DailyWeather> nextFiveDaysWeather,
  }) {
    return City(
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      currentWeather: currentWeather ?? this.currentWeather,
      nextFiveDaysWeather: nextFiveDaysWeather ?? this.nextFiveDaysWeather,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object> get props => [
        name,
        countryCode,
        currentWeather,
        nextFiveDaysWeather,
      ];
}
