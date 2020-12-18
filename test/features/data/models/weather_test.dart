import 'dart:convert';

import 'package:rock_weather/features/weather/data/models/weather.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final weatherModel = WeatherModel(
    currentTemperature: 35.56,
    dateTime: DateTime.fromMillisecondsSinceEpoch(1608318068, isUtc: true),
    feelsLike: 39.49,
    maximumTemperature: 35.56,
    minimumTemperature: 35.56,
  );

  test('Should be a suclass of Weather Entity', () async {
    //! Assert
    expect(weatherModel, isA<Weather>());
  });

  test('Should return a valid instance when converting with [fromJson]',
      () async {
    //* Act
    final result = WeatherModel.fromJson(json.decode(fixture('weather.json')));

    //! Assert
    expect(result, weatherModel);
  });
}
