import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/data/models/current_weather_model.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:rock_weather/shared/errors/exceptions.dart';

abstract class WeatherRemoteDataSource {
  ///* Calls NetworkClient to get the current weather from the API
  ///* If something goes wrong in NetworkClient, it throws a ServerException
  Future<CurrentWeather> getCurrentWeatherForCity({@required City city});

  ///* Calls NetworkClient to get the weather for the next five days from the API
  ///* If something goes wrong in NetworkClient, it throws a ServerException
  Future<List<CurrentWeather>> getWeatherForNextFiveDaysForCity(
      {@required City city});
}

class WeatherRemoteDataSourceImplementation implements WeatherRemoteDataSource {
  final apiKey = '9a93bbae393141542d757e668996f369';

  final Dio networkClient;

  const WeatherRemoteDataSourceImplementation({@required this.networkClient});

  @override
  Future<CurrentWeather> getCurrentWeatherForCity({@required City city}) async {
    final url =
        'onecall?lat=${city.latitude}&lon=${city.longitude}&exclude=daily,minutely,hourly,alerts&appid=$apiKey&units=metric';

    try {
      final result = await networkClient.get(url);
      if (result?.data?.isNotEmpty == true) {
        return CurrentWeatherModel.fromJson(result.data);
      }
      throw ServerException(errorMessage: 'Nothing found');
    } on DioError {
      throw ServerException();
    }
  }

  @override
  Future<List<CurrentWeather>> getWeatherForNextFiveDaysForCity({
    @required City city,
  }) async {
    final url =
        'onecall?lat=${city.latitude}&lon=${city.longitude}&exclude=current,minutely,hourly,alerts&appid=$apiKey&units=metric';

    try {
      final result = await networkClient.get(url);
      if (result?.data?.isNotEmpty == true) {
        final weatherListJson = result.data['daily'] as List;
        if (weatherListJson?.isNotEmpty == true) {
          var weatherModels = <CurrentWeatherModel>[];
          weatherListJson.forEach((json) {
            if (weatherModels.length < 5) {
              weatherModels.add(CurrentWeatherModel.fromJson(json));
            }
          });
          return weatherModels;
        }
      }
      throw ServerException(errorMessage: 'Nothing found');
    } on DioError {
      throw ServerException();
    }
  }
}
