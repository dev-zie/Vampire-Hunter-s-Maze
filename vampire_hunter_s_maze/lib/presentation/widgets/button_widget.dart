import 'package:flutter/material.dart';
import 'package:vampire_hunter_s_maze/presentation/view/maze_view.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.page});

  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MazeView();
            },
          ),
        );
      },
      child: Text(text),
    );
  }
}
