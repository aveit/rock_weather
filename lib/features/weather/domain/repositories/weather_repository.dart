import 'package:dartz/dartz.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:rock_weather/features/weather/domain/entities/daily_weather.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:meta/meta.dart';

abstract class WeatherRepository {
  ///* Calls the datasource to retrieve the current weather for the City passed as a parameter
  ///* If something fails, return Left with a Failure
  Future<Either<Failure, CurrentWeather>> getCurrentWeatherForCity({
    @required City city,
  });

  ///* Calls the datasource to retrieve the weather for the next five days for the City passed as a parameter
  ///* If something fails, return Left with a Failure
  Future<Either<Failure, List<DailyWeather>>> getWeatherForNextFiveDaysForCity({
    @required City city,
  });
}
