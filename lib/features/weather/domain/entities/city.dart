import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';

class City extends Equatable {
  final String name;
  final String stateCode;
  final String countryCode;
  final Weather currentWeather;
  final List<Weather> nextFiveDaysWeather;

  City({
    @required this.name,
    @required this.stateCode,
    @required this.countryCode,
    @required this.currentWeather,
    @required this.nextFiveDaysWeather,
  });

  City copyWith({
    String name,
    String stateCode,
    String countryCode,
    Weather currentWeather,
    List<Weather> nextFiveDaysWeather,
  }) {
    return City(
      name: name ?? this.name,
      stateCode: stateCode ?? this.stateCode,
      countryCode: countryCode ?? this.countryCode,
      currentWeather: currentWeather ?? this.currentWeather,
      nextFiveDaysWeather: nextFiveDaysWeather ?? this.nextFiveDaysWeather,
    );
  }

  @override
  List<Object> get props => [
        name,
        stateCode,
        countryCode,
        currentWeather,
        nextFiveDaysWeather,
      ];
}
