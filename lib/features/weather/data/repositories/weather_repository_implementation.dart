import 'package:rock_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:dartz/dartz.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/shared/network_info.dart';

class WeatherRepositoryImplementation implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const WeatherRepositoryImplementation({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Weather>> getCurrentWeatherForCity({
    @required City city,
  }) async {
    await networkInfo.isConnected;
    final weather = await remoteDataSource.getCurrentWeatherForCity(city: city);
    return Right(weather);
  }
}
