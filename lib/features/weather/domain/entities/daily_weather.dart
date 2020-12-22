import 'package:equatable/equatable.dart';

class DailyWeather extends Equatable {
  final int dt;
  final int sunrise;
  final int sunset;
  final Temp temp;
  final FeelsLike feelsLike;
  final int humidity;
  final List<Weather> weather;
  final num rain;

  DailyWeather({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.humidity,
    this.weather,
    this.rain,
  });

  @override
  List<Object> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        humidity,
        weather,
        rain,
      ];
}

class Temp extends Equatable {
  final num day;
  final num min;
  final num max;
  final num night;
  final num eve;
  final num morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json['day'],
        min: json['min'],
        max: json['max'],
        night: json['night'],
        eve: json['eve'],
        morn: json['morn'],
      );

  @override
  List<Object> get props => [
        day,
        min,
        max,
        night,
        eve,
        morn,
      ];
}

class FeelsLike extends Equatable {
  final num day;
  final num night;
  final num eve;
  final num morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json['day'],
        night: json['night'],
        eve: json['eve'],
        morn: json['morn'],
      );

  @override
  List<Object> get props => [
        day,
        night,
        eve,
        morn,
      ];
}

class Weather extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );

  @override
  List<Object> get props => [
        id,
        main,
        description,
        icon,
      ];
}
