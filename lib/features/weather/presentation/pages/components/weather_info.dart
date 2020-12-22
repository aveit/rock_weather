import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key key,
    @required this.title,
    @required this.info,
  }) : super(key: key);

  final String info;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(title),
          Spacer(),
          Text(info),
        ],
      ),
    );
  }
}
