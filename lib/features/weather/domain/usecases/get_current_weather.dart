import 'package:dartz/dartz.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/shared/failures.dart';
import 'package:rock_weather/shared/usecase.dart';
import 'package:meta/meta.dart';

class GetWeather implements UseCase<List<Weather>, GetWeatherParams> {
  final WeatherRepository weatherRepository;

  const GetWeather({@required this.weatherRepository});

  @override
  Future<Either<Failure, List<Weather>>> call({
    @required GetWeatherParams params,
  }) {
    return weatherRepository.getCurrentWeatherForCity(city: params.city);
  }
}

class GetWeatherParams {
  final City city;

  const GetWeatherParams({@required this.city});
}
