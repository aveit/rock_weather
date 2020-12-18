import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
  final DateTime dateTime;
  final double currentTemperature;
  final double feelsLike;
  final double minimumTemperature;
  final double maximumTemperature;

  const Weather({
    @required this.dateTime,
    @required this.currentTemperature,
    @required this.feelsLike,
    @required this.minimumTemperature,
    @required this.maximumTemperature,
  });

  @override
  List<Object> get props => [
        dateTime,
        currentTemperature,
        feelsLike,
        minimumTemperature,
        maximumTemperature,
      ];
}
