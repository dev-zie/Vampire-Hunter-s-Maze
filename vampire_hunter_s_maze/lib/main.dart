import 'package:flutter/material.dart';
import 'package:vampire_hunter_s_maze/presentation/view/home_view.dart';

void main() {
  runApp(const VampireHuntersMazeApp());
}

class VampireHuntersMazeApp extends StatelessWidget {
  const VampireHuntersMazeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
