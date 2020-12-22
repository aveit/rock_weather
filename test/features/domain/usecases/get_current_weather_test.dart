import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_current_weather.dart';
import 'package:test/test.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  GetWeather getWeather;
  MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getWeather = GetWeather(weatherRepository: mockWeatherRepository);
  });

  test('Should call the repository to get data', () async {
    //? Arrange
    final city = City(
      name: 'Brasilia',
      countryCode: 'BR',
      currentWeather: null,
      nextFiveDaysWeather: null,
      latitude: 1,
      longitude: 1,
    );

    //* Act
    await getWeather(params: GetWeatherParams(city: city));

    //! Assert
    verify(mockWeatherRepository.getCurrentWeatherForCity(city: city))
        .called(1);
  });
}
