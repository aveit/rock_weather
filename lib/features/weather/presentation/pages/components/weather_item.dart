import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:rock_weather/features/weather/presentation/blocs/next_five_days/next_five_days_weather_bloc.dart';
import 'package:rock_weather/features/weather/presentation/pages/components/weather_icon.dart';
import 'package:rock_weather/shared/services/service_locator.dart';

import '../city_details_page.dart';

class WeatherItem extends StatelessWidget {
  final City city;

  const WeatherItem({
    Key key,
    @required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            return Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: BlocProvider.of<CurrentWeatherBloc>(context),
                    ),
                    BlocProvider.value(
                      value: serviceLocator.get<NextFiveDaysWeatherBloc>()
                        ..add(
                          NextFiveDaysWeatherEvent
                              .getWeatherForNextFiveDaysForCity(city: city),
                        ),
                    )
                  ],
                  child: CityDetailsPage(
                    city: city,
                  ),
                ),
              ),
            );
          },
          child: Card(
            child: ListTile(
              title: Text(city.name,
                  style: TextStyle(fontWeight: FontWeight.w500)),
              trailing: Builder(
                builder: (context) {
                  if (state.error.isNotEmpty) {
                    return Container(
                      child: Icon(
                        Icons.error,
                        color: Colors.red.shade900,
                      ),
                    );
                  } else if (state.loadedCity != null) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WeatherIcon(
                          iconId: state.loadedCity.currentWeather.weatherIcon,
                        ),
                        Container(
                          child: Text(
                            state.loadedCity.currentWeather.temp
                                    .toStringAsFixed(0) +
                                ' ºC',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
