import 'package:rock_weather/features/weather/domain/entities/daily_weather.dart';

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel({
    final int dt,
    final int sunrise,
    final int sunset,
    final Temp temp,
    final FeelsLike feelsLike,
    final int humidity,
    final List<Weather> weather,
    final num rain,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          temp: temp,
          feelsLike: feelsLike,
          humidity: humidity,
          weather: weather,
          rain: rain,
        );

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'] != null ? new Temp.fromJson(json['temp']) : null,
      feelsLike: json['feels_like'] != null
          ? new FeelsLike.fromJson(json['feels_like'])
          : null,
      humidity: json['humidity'],
      // weather: json['weather'] == null
      //     ? null
      //     : json['weather'].map((v) {
      //         return Weather.fromJson(v);
      //       }).toList<Weather>(),
      rain: json['rain'],
    );
  }
}
