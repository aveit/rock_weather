import 'package:rock_weather/features/weather/domain/entities/daily_weather.dart';
import 'package:rock_weather/features/weather/domain/entities/temperature.dart';

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel({
    DateTime dateTime,
    Temperature temp,
    String weatherDescription,
    String weatherIcon,
  }) : super(
          dateTime: dateTime,
          temperature: temp,
          weatherDescription: weatherDescription,
          weatherIcon: weatherIcon,
        );

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        int.tryParse(json['dt'].toString() + '000'),
      ),
      temp:
          json['temp'] != null ? new Temperature.fromJson(json['temp']) : null,
      weatherIcon: json['weather'] == null ? null : json['weather'][0]['icon'],
      weatherDescription:
          json['weather'] == null ? null : json['weather'][0]['description'],
    );
  }
}
