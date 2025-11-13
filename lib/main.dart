import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Todo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: HomePage(),
    );
  }
}
