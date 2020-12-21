import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:rock_weather/features/weather/presentation/pages/dummy_data/concerts_data.dart';
import 'package:rock_weather/shared/services/service_locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<City, CurrentWeatherBloc> _blocs = {};

  @override
  void initState() {
    super.initState();
    concertList.forEach((concert) {
      _blocs[concert.city] = serviceLocator.get<CurrentWeatherBloc>()
        ..add(
          CurrentWeatherEvent.getCurrentWeatherForCity(city: concert.city),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🎸 Concerts'),
      ),
      body: ListView.builder(
        itemCount: _blocs.length,
        itemBuilder: (context, index) {
          final currentConcert = concertList.elementAt(index);
          return Card(
            child: ListTile(
              title: Text(currentConcert.city.name),
              trailing: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                cubit: _blocs[currentConcert.city],
                builder: (context, state) {
                  if (state == CurrentWeatherState.loading()) {
                    return CircularProgressIndicator();
                  } else if (state == CurrentWeatherState.error()) {
                    return Container(
                      child: Icon(Icons.error),
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
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
        },
      ),
    );
  }
}
