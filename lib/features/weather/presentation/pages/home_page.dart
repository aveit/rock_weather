import 'package:flutter/material.dart';
import 'package:rock_weather/features/weather/presentation/pages/dummy_data/concerts_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🎸 Concerts'),
      ),
      body: ListView.builder(
        itemCount: concertList.length,
        itemBuilder: (context, index) {
          final currentConcert = concertList.elementAt(index);
          return Card(
            child: ListTile(
              title: Text(currentConcert.city.name),
            ),
          );
        },
      ),
    );
  }
}
