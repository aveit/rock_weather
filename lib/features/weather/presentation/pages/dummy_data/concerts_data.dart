import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/concert.dart';

final concertList = [
  Concert(
    city: City(
      name: 'Silverstone',
      countryCode: 'UK',
      currentWeather: null,
      nextFiveDaysWeather: null,
      latitude: 52.0922,
      longitude: -1.026,
    ),
  ),
  Concert(
    city: City(
      name: 'São Paulo',
      countryCode: 'BR',
      currentWeather: null,
      nextFiveDaysWeather: null,
      latitude: -22,
      longitude: -49,
    ),
  ),
  Concert(
    city: City(
      name: 'Melbourne',
      countryCode: 'AU',
      currentWeather: null,
      nextFiveDaysWeather: null,
      latitude: -37.814,
      longitude: 144.9633,
    ),
  ),
  Concert(
    city: City(
      name: 'Monte Carlo',
      countryCode: 'MN',
      currentWeather: null,
      nextFiveDaysWeather: null,
      latitude: 43.7496,
      longitude: 7.437,
    ),
  ),
];
