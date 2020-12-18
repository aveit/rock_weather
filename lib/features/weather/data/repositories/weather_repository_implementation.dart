import 'package:rock_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:dartz/dartz.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/shared/errors/exceptions.dart';
import 'package:rock_weather/shared/errors/failures.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/shared/network/network_info.dart';

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
    try {
      if (!await networkInfo.isConnected) {
        throw ServerException(
          errorTitle: 'Not connected',
          errorMessage: 'Please verify your network connection.',
        );
      }
      final weather =
          await remoteDataSource.getCurrentWeatherForCity(city: city);
      return Right(weather);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        errorTitle: e.errorTitle,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Weather>>> getWeatherForNextFiveDaysForCity({
    @required City city,
  }) {}
}
