import 'package:flutter/material.dart';
import 'package:flutter_application_01/Widgets/car_lists.dart';
import 'class_cars_Widgets/glc_class.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CarListWidgets(),
        '/todo': (context) => const GlcClassWidget()
      },
    );
  }
}
