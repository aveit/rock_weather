import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/domain/usecases/get_next_five_days_weather.dart';

part 'next_five_days_weather_event.dart';
part 'next_five_days_weather_state.dart';
part 'next_five_days_weather_bloc.freezed.dart';

class NextFiveDaysWeatherBloc
    extends Bloc<NextFiveDaysWeatherEvent, NextFiveDaysWeatherState> {
  final GetWeatherForNextFiveDays getWeatherForNextFiveDays;

  NextFiveDaysWeatherBloc({
    @required this.getWeatherForNextFiveDays,
  }) : super(NextFiveDaysWeatherState.initial());

  @override
  Stream<NextFiveDaysWeatherState> mapEventToState(
    NextFiveDaysWeatherEvent event,
  ) async* {
    yield* event.map(
      getWeatherForNextFiveDaysForCity: (e) async* {
        yield state.copyWith(isLoading: true);
        final eitherListOfWeatherOrFail = await getWeatherForNextFiveDays(
          params: GetWeatherForNextFiveDaysParams(city: e.city),
        );

        yield* eitherListOfWeatherOrFail.fold(
          (failure) async* {
            yield state.copyWith(
              error: failure.errorMessage ?? 'Error to get Weather',
              isLoading: false,
            );
          },
          (result) async* {
            final cityWithLoadedWeather =
                e.city.copyWith(nextFiveDaysWeather: result);
            yield NextFiveDaysWeatherState.loaded(cityWithLoadedWeather);
          },
        );
      },
    );
  }
}
