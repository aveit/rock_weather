import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_current_weather.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';
part 'current_weather_bloc.freezed.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetWeather getCurrentWeather;

  CurrentWeatherBloc({
    @required this.getCurrentWeather,
  }) : super(_Initial());

  @override
  Stream<CurrentWeatherState> mapEventToState(
    CurrentWeatherEvent event,
  ) async* {
    yield* event.map(
      getCurrentWeatherForCity: (e) async* {
        yield CurrentWeatherState.loading();

        final eitherErrorOrSucces = await getCurrentWeather(
          params: GetWeatherParams(city: e.city),
        );

        yield* eitherErrorOrSucces.fold(
          (_) async* {
            yield CurrentWeatherState.error();
          },
          (weather) async* {
            yield CurrentWeatherState.loaded(
                e.city.copyWith(currentWeather: weather));
          },
        );
      },
    );
  }
}
