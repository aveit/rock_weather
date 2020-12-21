import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    @required DateTime dateTime,
    @required num currentTemperature,
    @required num feelsLike,
    @required num minimumTemperature,
    @required num maximumTemperature,
    @required String iconId,
  }) : super(
          dateTime: dateTime,
          currentTemperature: currentTemperature,
          feelsLike: feelsLike,
          minimumTemperature: minimumTemperature,
          maximumTemperature: maximumTemperature,
          iconId: iconId,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'], isUtc: true),
      currentTemperature: json['main']['temp'] as num,
      feelsLike: json['main']['feels_like'] as num,
      minimumTemperature: json['main']['temp_min'] as num,
      maximumTemperature: json['main']['temp_max'] as num,
      iconId: json['weather'][0]['icon'],
    );
  }
}
