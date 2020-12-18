import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    @required DateTime dateTime,
    @required double currentTemperature,
    @required double feelsLike,
    @required double minimumTemperature,
    @required double maximumTemperature,
  }) : super(
          dateTime: dateTime,
          currentTemperature: currentTemperature,
          feelsLike: feelsLike,
          minimumTemperature: minimumTemperature,
          maximumTemperature: maximumTemperature,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'], isUtc: true),
      currentTemperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      minimumTemperature: json['main']['temp_min'],
      maximumTemperature: json['main']['temp_max'],
    );
  }
}
