import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:rock_weather/features/weather/data/repositories/weather_repository_implementation.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/shared/network_info.dart';
import 'package:test/test.dart';

class MockWeatherRemoteDataSouce extends Mock
    implements WeatherRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  WeatherRepositoryImplementation weatherRepository;
  MockWeatherRemoteDataSouce mockWeatherRemoteDataSouce;
  MockNetworkInfo mockNetworkInfo;

  final city = City(name: 'Brasilia', stateCode: 'DF', countryCode: 'BR');

  setUp(() {
    mockWeatherRemoteDataSouce = MockWeatherRemoteDataSouce();
    mockNetworkInfo = MockNetworkInfo();

    weatherRepository = WeatherRepositoryImplementation(
      remoteDataSource: mockWeatherRemoteDataSouce,
      networkInfo: mockNetworkInfo,
    );
  });

  group('[ONLINE]', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    tearDown(() {
      verify(mockNetworkInfo.isConnected);
    });

    test('Should call remote datasource to get data', () async {
      //* Act
      await weatherRepository.getCurrentWeatherForCity(city: city);
      //! Assert
      verify(mockWeatherRemoteDataSouce.getCurrentWeatherForCity(city: city));
    });
  });
}
