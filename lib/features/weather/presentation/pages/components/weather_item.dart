import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';

class WeatherItem extends StatelessWidget {
  final City city;

  const WeatherItem({
    Key key,
    @required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(city.name),
        trailing: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
          builder: (context, state) {
            if (state == CurrentWeatherState.loading()) {
              return CircularProgressIndicator();
            } else if (state == CurrentWeatherState.error()) {
              return Container(
                child: Icon(
                  Icons.error,
                  color: Colors.red.shade900,
                ),
              );
            } else {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'http://openweathermap.org/img/wn/${state.loadedCity.currentWeather.iconId}@2x.png',
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                  Container(
                    child: Text(
                      state.loadedCity.currentWeather.currentTemperature
                              .toString() +
                          ' ºC',
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
