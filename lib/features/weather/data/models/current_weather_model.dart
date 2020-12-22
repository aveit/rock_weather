import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';

class CurrentWeatherModel extends CurrentWeather {
  CurrentWeatherModel({
    DateTime dateTime,
    DateTime dateTimeSunrise,
    DateTime dateTimeSunset,
    num temp,
    num feelsLike,
    int humidity,
    int clouds,
    int visibility,
    int windSpeed,
    int windDeg,
    String weatherDescription,
    String weatherIcon,
  }) : super(
          dateTime: dateTime,
          dateTimeSunset: dateTimeSunset,
          dateTimeSunrise: dateTimeSunrise,
          temp: temp,
          feelsLike: feelsLike,
          humidity: humidity,
          clouds: clouds,
          visibility: visibility,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weatherDescription: weatherDescription,
          weatherIcon: weatherIcon,
        );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      dateTime: json['dt'] == null ? null : dateFromJson(json['dt']),
      dateTimeSunset:
          json['sunset'] == null ? null : dateFromJson(json['sunset']),
      dateTimeSunrise:
          json['sunrise'] == null ? null : dateFromJson(json['sunrise']),
      temp: json['temp'],
      feelsLike: json['feels_like'],
      humidity: json['humidity'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      weatherDescription:
          json['weather'] == null ? null : json['weather'][0]['description'],
      weatherIcon: json['weather'] == null ? null : json['weather'][0]['icon'],
    );
  }

  static dateFromJson(int jsonEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(
        int.tryParse('$jsonEpoch' + '000'));
  }
}
