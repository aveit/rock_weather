import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';

abstract class WeatherRemoteDataSource {
  ///* Calls Dio to get the data from the API
  ///* If something goes wrong in Dio, it throws a ServerException
  Future<Weather> getCurrentWeatherForCity({@required City city});
}
