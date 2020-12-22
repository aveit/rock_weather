import 'dart:convert';

import 'package:rock_weather/features/weather/data/models/current_weather_model.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final weatherModel = CurrentWeatherModel(
    dateTime: DateTime.fromMillisecondsSinceEpoch(1608316565000),
    clouds: 1,
    dateTimeSunrise: DateTime.fromMillisecondsSinceEpoch(1608316565000),
    dateTimeSunset: DateTime.fromMillisecondsSinceEpoch(1608316565000),
    feelsLike: 1,
    humidity: 1,
    temp: 1,
    visibility: 1,
    weatherDescription: 'ANY',
    weatherIcon: 'ANY',
    windDeg: 1,
    windSpeed: 1,
  );

  test('Should be a suclass of Weather Entity', () async {
    //! Assert
    expect(weatherModel, isA<CurrentWeather>());
  });

  test('Should return a valid instance when converting with [fromJson]',
      () async {
    //* Act
    final jsonFixture = json.decode(fixture('current_weather.json'));
    final jsonMap = jsonFixture['current'];

    final result = CurrentWeatherModel.fromJson(jsonMap);

    //! Assert
    expect(result, weatherModel);
  });
}
