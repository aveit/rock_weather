import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:rock_weather/features/weather/data/repositories/weather_repository_implementation.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_current_weather.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_next_five_days_weather.dart';
import 'package:rock_weather/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:rock_weather/features/weather/presentation/blocs/next_five_days/next_five_days_weather_bloc.dart';
import 'package:rock_weather/shared/network/network_info.dart';

const DEFAULT_CONNECTION_TIMEOUT = const Duration(seconds: 10);
const DEFAULT_RECEIVE_TIMEOUT = const Duration(seconds: 10);

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  ServiceLocator._();

  /// Instantiates our dependencies
  ///
  /// Ideally this method shoud be executed at the start of the app life cycle.
  static Future<void> init() async {
    await _registerNetwork();
    await _registerDataSources();
    await _registerRepositories();
    await _registerUseCases();
    await _registerBlocs();
  }

  static Future<Dio> _buildDio() async {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      connectTimeout: DEFAULT_CONNECTION_TIMEOUT.inMilliseconds,
      receiveTimeout: DEFAULT_RECEIVE_TIMEOUT.inMilliseconds,
    );

    final dio = Dio(options)
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            options.headers['Content-Type'] = "application/json";
            options.headers['Accept'] = "application/json";
          },
        ),
      );

    return dio;
  }

  static Future<void> _registerNetwork() async {
    serviceLocator.registerSingletonAsync(() async => await _buildDio());
    serviceLocator.registerSingleton(DataConnectionChecker());
    serviceLocator
        .registerSingleton<NetworkInfo>(NetworkInfoImpl(serviceLocator()));
  }

  static Future<void> _registerDataSources() async {
    final dio = await serviceLocator.getAsync<Dio>();
    serviceLocator.registerSingleton<WeatherRemoteDataSource>(
      WeatherRemoteDataSourceImplementation(
        networkClient: dio,
      ),
    );
  }

  static Future<void> _registerRepositories() async {
    serviceLocator
        .registerSingleton<WeatherRepository>(WeatherRepositoryImplementation(
      remoteDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ));
  }

  static Future<void> _registerUseCases() async {
    serviceLocator.registerSingleton(GetWeather(
      weatherRepository: serviceLocator(),
    ));

    serviceLocator.registerSingleton(GetWeatherForNextFiveDays(
      weatherRepository: serviceLocator(),
    ));
  }

  static Future<void> _registerBlocs() async {
    serviceLocator.registerFactory(
      () => CurrentWeatherBloc(getCurrentWeather: serviceLocator()),
    );

    serviceLocator.registerFactory(
      () => NextFiveDaysWeatherBloc(
        getWeatherForNextFiveDays: serviceLocator(),
      ),
    );
  }
}
