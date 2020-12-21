import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_next_five_days_weather.dart';
import 'package:test/test.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  GetWeatherForNextFiveDays getWeather;
  MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getWeather =
        GetWeatherForNextFiveDays(weatherRepository: mockWeatherRepository);
  });

  test('Should call the repository to get data', () async {
    //? Arrange
    final city = City(
      name: 'Brasilia',
      stateCode: 'DF',
      countryCode: 'BR',
      currentWeather: null,
      nextFiveDaysWeather: null,
    );

    //* Act
    await getWeather(params: GetWeatherForNextFiveDaysParams(city: city));

    //! Assert
    verify(mockWeatherRepository.getWeatherForNextFiveDaysForCity(city: city))
        .called(1);
  });
}
