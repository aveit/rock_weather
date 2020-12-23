import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  final DateTime dateTime;
  final num temp;
  final num feelsLike;
  final String weatherDescription;
  final String weatherIcon;

  const CurrentWeather({
    this.dateTime,
    this.temp,
    this.feelsLike,
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
        temp,
        feelsLike,
        weatherDescription,
        weatherIcon,
      ];
}
