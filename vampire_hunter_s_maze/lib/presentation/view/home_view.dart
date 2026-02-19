import 'package:flutter/material.dart';
import 'package:vampire_hunter_s_maze/presentation/widgets/button_widget.dart';
import 'package:vampire_hunter_s_maze/presentation/widgets/title_text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vampire Hunter\'s Maze')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TitleTextWidget(
            text:
                'Welcome to the maze. If you succeed, you are ready for the real world',
          ),
          ButtonWidget(text: 'Next', page: AboutDialog()),
        ],
      ),
    );
  }
}
