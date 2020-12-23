import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/weather/domain/entities/city.dart';

class Concert extends Equatable {
  final City city;

  const Concert({@required this.city});

  @override
  List<Object> get props => [city];
}
