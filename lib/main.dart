import 'package:MovieFlixer/colors.dart';
import 'package:MovieFlixer/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieFlixer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 237, 230, 195),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
