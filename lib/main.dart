import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/dependency_provider.dart';

void main() {
  // set up dependencies
  setUpDependencyInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funda Assessment',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
