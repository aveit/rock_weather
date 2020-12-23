import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rock_weather/features/weather/domain/entities/daily_weather.dart';
import 'package:rock_weather/features/weather/presentation/pages/components/weather_icon.dart';
import 'package:rock_weather/features/weather/presentation/pages/components/weather_info.dart';

class WeatherDay extends StatelessWidget {
  const WeatherDay({
    Key key,
    @required this.weatherDay,
  }) : super(key: key);

  final DailyWeather weatherDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherInfo(
          leading: DateFormat.MMMEd().format(weatherDay.dateTime),
          info: weatherDay.temperature.max.toStringAsFixed(0) +
              '  /  ' +
              weatherDay.temperature.min.toStringAsFixed(0) +
              ' ºC',
          trailing: SizedBox(
            height: 36,
            child: WeatherIcon(
              iconId: weatherDay.weatherIcon,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
