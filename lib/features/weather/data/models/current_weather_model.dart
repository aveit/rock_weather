import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';

class CurrentWeatherModel extends CurrentWeather {
  CurrentWeatherModel({
    DateTime dateTime,
    num temp,
    num feelsLike,
    String weatherDescription,
    String weatherIcon,
  }) : super(
          dateTime: dateTime,
          temp: temp,
          feelsLike: feelsLike,
          weatherDescription: weatherDescription,
          weatherIcon: weatherIcon,
        );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      dateTime: json['dt'] == null ? null : dateFromJson(json['dt']),
      temp: json['temp'],
      feelsLike: json['feels_like'],
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
