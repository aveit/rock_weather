import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_current_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getCurrentWeather;

  WeatherBloc({
    @required this.getCurrentWeather,
  }) : super(_Initial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield* event.map(
      getCurrentWeatherForCity: (e) async* {
        yield WeatherState.loading();

        final eitherErrorOrSucces = await getCurrentWeather(
          params: GetWeatherParams(city: e.city),
        );

        yield* eitherErrorOrSucces.fold(
          (_) async* {
            yield WeatherState.error();
          },
          (weather) async* {
            yield WeatherState.loaded(weather);
          },
        );
      },
    );
  }
}
