import 'package:meta/meta.dart';

class Weather {
  final DateTime dateTime;
  final double currentTemperature;
  final double feelsLike;
  final double minimumTemperature;
  final double maximumTemperature;

  Weather({
    @required this.dateTime,
    @required this.currentTemperature,
    @required this.feelsLike,
    @required this.minimumTemperature,
    @required this.maximumTemperature,
  });
}
