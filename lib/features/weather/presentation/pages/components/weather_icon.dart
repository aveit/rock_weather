import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String iconId;

  const WeatherIcon({Key key, @required this.iconId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'http://openweathermap.org/img/wn/$iconId@2x.png',
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent loadingProgress,
      ) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
              : null,
        );
      },
    );
  }
}
