import 'package:equatable/equatable.dart';

class Temperature extends Equatable {
  final num min;
  final num max;

  Temperature({
    this.min,
    this.max,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        min: json['min'],
        max: json['max'],
      );

  @override
  List<Object> get props => [
        min,
        max,
      ];
}
