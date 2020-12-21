import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/data/models/weather.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/shared/errors/exceptions.dart';

abstract class WeatherRemoteDataSource {
  ///* Calls NetworkClient to get the current weather from the API
  ///* If something goes wrong in NetworkClient, it throws a ServerException
  Future<Weather> getCurrentWeatherForCity({@required City city});

  ///* Calls NetworkClient to get the weather for the next five days from the API
  ///* If something goes wrong in NetworkClient, it throws a ServerException
  Future<List<Weather>> getWeatherForNextFiveDaysForCity({@required City city});
}

class WeatherRemoteDataSourceImplementation implements WeatherRemoteDataSource {
  final apiKey = '9a93bbae393141542d757e668996f369';

  final Dio networkClient;

  const WeatherRemoteDataSourceImplementation({@required this.networkClient});

  @override
  Future<Weather> getCurrentWeatherForCity({@required City city}) async {
    final url =
        'weather?q=${city.name},${city.stateCode},${city.countryCode}&appid=$apiKey&units=metric';

    try {
      final result = await networkClient.get(url);
      if (result?.data?.isNotEmpty == true) {
        return WeatherModel.fromJson(result.data);
      }
      throw ServerException(errorMessage: 'Nothing found');
    } on DioError {
      throw ServerException();
    }
  }

  @override
  Future<List<Weather>> getWeatherForNextFiveDaysForCity({
    @required City city,
  }) async {
    final url =
        'forecast?q=${city.name},${city.stateCode},${city.countryCode}&appid=$apiKey&units=metric';

    try {
      final result = await networkClient.get(url);
      if (result?.data?.isNotEmpty == true) {
        final weatherListJson = result.data['list'] as List;
        if (weatherListJson?.isNotEmpty == true) {
          var weatherModels = <WeatherModel>[];
          weatherListJson.forEach((json) {
            weatherModels.add(WeatherModel.fromJson(json));
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
