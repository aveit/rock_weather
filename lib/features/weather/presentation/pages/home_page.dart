import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';
import 'package:rock_weather/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:rock_weather/features/weather/presentation/pages/dummy_data/concerts_data.dart';
import 'package:rock_weather/shared/services/service_locator.dart';

import 'components/weather_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<City, CurrentWeatherBloc> _blocs = {};

  void loadConcertsWeather() {
    _blocs.forEach((city, bloc) {
      bloc.add(CurrentWeatherEvent.getCurrentWeatherForCity(city: city));
    });
  }

  @override
  void initState() {
    super.initState();

    concertList.forEach((concert) {
      _blocs[concert.city] = serviceLocator.get<CurrentWeatherBloc>();
    });
    loadConcertsWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🎸 Concerts',
        ),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: loadConcertsWeather),
        ],
      ),
      body: ListView.builder(
        itemCount: _blocs.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final currentConcert = concertList.elementAt(index);
          return BlocProvider.value(
            value: _blocs[currentConcert.city],
            child: WeatherItem(
              city: currentConcert.city,
            ),
          );
        },
      ),
    );
  }
}
