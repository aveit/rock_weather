import 'package:flutter/material.dart';
import 'package:rock_weather/features/weather/presentation/pages/home_page.dart';
import 'package:rock_weather/shared/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.red.shade900,
        ),
      ),
      home: HomePage(),
    );
  }
}
