import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
  final DateTime dateTime;
  final num currentTemperature;
  final num feelsLike;
  final num minimumTemperature;
  final num maximumTemperature;
  final String iconId;

  const Weather({
    @required this.dateTime,
    @required this.currentTemperature,
    @required this.feelsLike,
    @required this.minimumTemperature,
    @required this.maximumTemperature,
    @required this.iconId,
  });

  @override
  List<Object> get props => [
        dateTime,
        currentTemperature,
        feelsLike,
        minimumTemperature,
        maximumTemperature,
        iconId,
      ];
}
