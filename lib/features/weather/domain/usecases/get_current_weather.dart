import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/current_weather.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:rock_weather/shared/usecase.dart';
import 'package:meta/meta.dart';

class GetWeather implements UseCase<CurrentWeather, GetWeatherParams> {
  final WeatherRepository weatherRepository;

  const GetWeather({@required this.weatherRepository});

  @override
  Future<Either<Failure, CurrentWeather>> call({
    @required GetWeatherParams params,
  }) {
    return weatherRepository.getCurrentWeatherForCity(city: params.city);
  }
}

class GetWeatherParams extends Equatable {
  final City city;

  const GetWeatherParams({@required this.city});

  @override
  List<Object> get props => [city];
}
