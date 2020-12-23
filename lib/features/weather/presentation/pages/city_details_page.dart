import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:rock_weather/features/weather/presentation/blocs/next_five_days/next_five_days_weather_bloc.dart';

import 'components/weather_day.dart';
import 'components/weather_icon.dart';

class CityDetailsPage extends StatelessWidget {
  final City city;

  static const routeName = 'city-details';

  const CityDetailsPage({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                city.name,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () =>
                      BlocProvider.of<NextFiveDaysWeatherBloc>(context).add(
                        NextFiveDaysWeatherEvent
                            .getWeatherForNextFiveDaysForCity(city: city),
                      ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (state.error.isEmpty && state.loadedCity != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 48,
                                  child: WeatherIcon(
                                    iconId: state
                                        .loadedCity.currentWeather.weatherIcon,
                                  ),
                                ),
                                Text(
                                  state.loadedCity.currentWeather
                                      .weatherDescription
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                state.loadedCity.currentWeather.temp
                                        .toStringAsFixed(0) +
                                    ' ºC',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Feels Like ',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle2
                                        .copyWith(
                                          color: Colors.grey,
                                        ),
                                  ),
                                  Text(
                                    state.loadedCity.currentWeather.feelsLike
                                            .toStringAsFixed(0) +
                                        ' ºC',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle2
                                        .copyWith(
                                          color: Colors.grey,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next Five Days',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Divider(),
                          BlocBuilder<NextFiveDaysWeatherBloc,
                              NextFiveDaysWeatherState>(
                            builder: (context, state) {
                              if (state.isLoading) {
                                return CircularProgressIndicator();
                              } else if (state.loadedCity != null) {
                                var children = <Widget>[];
                                if (state.error.isNotEmpty) {
                                  children.add(Column(
                                    children: [
                                      Text(state.error),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Cached values:',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ));
                                }
                                children.add(ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state
                                      .loadedCity.nextFiveDaysWeather.length,
                                  itemBuilder: (context, index) {
                                    final weatherDay = state
                                        .loadedCity.nextFiveDaysWeather
                                        .elementAt(index);
                                    return WeatherDay(weatherDay: weatherDay);
                                  },
                                ));
                                return Column(
                                  children: children,
                                );
                              } else if (state.error.isNotEmpty) {
                                return Text(state.error);
                              } else {
                                return Text('EMPTY');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
