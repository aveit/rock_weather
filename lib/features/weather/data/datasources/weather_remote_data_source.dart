import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/shared/errors/exceptions.dart';

abstract class WeatherRemoteDataSource {
  ///* Calls NetworkClient to get the data from the API
  ///* If something goes wrong in NetworkClient, it throws a ServerException
  Future<Weather> getCurrentWeatherForCity({@required City city});
}

class WeatherRemoteDataSourceImplementation implements WeatherRemoteDataSource {
  final apiKey = '';

  final Dio networkClient;

  const WeatherRemoteDataSourceImplementation({@required this.networkClient});

  @override
  Future<Weather> getCurrentWeatherForCity({@required City city}) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=${city.name},${city.stateCode},${city.countryCode}&appid=$apiKey';

    try {
      await networkClient.get(url);
    } on DioError {
      throw ServerException();
    }
  }
}
