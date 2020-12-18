import 'package:dartz/dartz.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:rock_weather/shared/usecase.dart';
import 'package:meta/meta.dart';

class GetWeatherForNextFiveDays
    implements UseCase<List<Weather>, GetWeatherForNextFiveDaysParams> {
  final WeatherRepository weatherRepository;

  const GetWeatherForNextFiveDays({@required this.weatherRepository});

  @override
  Future<Either<Failure, List<Weather>>> call({
    @required GetWeatherForNextFiveDaysParams params,
  }) {
    return weatherRepository.getWeatherForNextFiveDaysForCity(
      city: params.city,
    );
  }
}

class GetWeatherForNextFiveDaysParams {
  final City city;

  const GetWeatherForNextFiveDaysParams({@required this.city});
}
