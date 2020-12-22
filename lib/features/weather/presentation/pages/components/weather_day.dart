import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:rock_weather/features/weather/presentation/pages/components/weather_info.dart';

class WeatherDay extends StatelessWidget {
  const WeatherDay({
    Key key,
    @required this.weatherDay,
  }) : super(key: key);

  final CurrentWeather weatherDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  DateFormat.MMMEd().format(
                    weatherDay.dateTime,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(),
        // WeatherInfo(
        //   title: 'Min',
        //   info: weatherDay.minimumTemperature.toString(),
        // ),
        // WeatherInfo(
        //   title: 'Max',
        //   info: weatherDay.maximumTemperature.toString(),
        // ),
        Divider(),
      ],
    );
  }
}
