import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/entities/weather.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_next_five_days_weather.dart';

part 'next_five_days_weather_event.dart';
part 'next_five_days_weather_state.dart';
part 'next_five_days_weather_bloc.freezed.dart';

class NextFiveDaysWeatherBloc
    extends Bloc<NextFiveDaysWeatherEvent, NextFiveDaysWeatherState> {
  final GetWeatherForNextFiveDays getWeatherForNextFiveDays;

  NextFiveDaysWeatherBloc({
    @required this.getWeatherForNextFiveDays,
  }) : super(_Initial());

  @override
  Stream<NextFiveDaysWeatherState> mapEventToState(
    NextFiveDaysWeatherEvent event,
  ) async* {
    yield* event.map(
      getWeatherForNextFiveDaysForCity: (e) async* {
        yield NextFiveDaysWeatherState.loading();
        final eitherListOfWeatherOrFail = await getWeatherForNextFiveDays(
          params: GetWeatherForNextFiveDaysParams(city: e.city),
        );

        yield* eitherListOfWeatherOrFail.fold(
          (_) async* {
            yield NextFiveDaysWeatherState.error();
          },
          (result) async* {
            yield NextFiveDaysWeatherState.loaded(result);
          },
        );
      },
    );
  }
}
