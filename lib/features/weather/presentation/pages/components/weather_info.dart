import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key key,
    @required this.leading,
    @required this.info,
    this.trailing,
  }) : super(key: key);

  final String info;
  final String leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(leading),
          Spacer(),
          Text(info),
          if (trailing != null) trailing
        ],
      ),
    );
  }
}
