import 'package:rock_weather/features/weather/domain/entities/daily_weather.dart';
import 'package:rock_weather/features/weather/domain/entities/temperature.dart';

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel({
    DateTime dateTime,
    Temperature temp,
    int humidity,
    String weatherDescription,
    String weatherIcon,
    num rain,
  }) : super(
          dateTime: dateTime,
          temperature: temp,
          humidity: humidity,
          weatherDescription: weatherDescription,
          weatherIcon: weatherIcon,
          rain: rain,
        );

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        int.tryParse(json['dt'].toString() + '000'),
      ),
      temp:
          json['temp'] != null ? new Temperature.fromJson(json['temp']) : null,
      humidity: json['humidity'],
      weatherIcon: json['weather'] == null ? null : json['weather'][0]['icon'],
      weatherDescription:
          json['weather'] == null ? null : json['weather'][0]['description'],
      rain: json['rain'],
    );
  }
}
