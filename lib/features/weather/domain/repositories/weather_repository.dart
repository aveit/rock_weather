import 'package:dartz/dartz.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/shared/failures.dart';
import 'package:meta/meta.dart';

abstract class WeatherRepository {
  ///* Calls the datasource to retrieve the current weather for the City passed as a parameter
  ///* If something fails, return Left with a Failure
  Future<Either<Failure, List<Weather>>> getCurrentWeatherForCity({
    @required City city,
  });
}
