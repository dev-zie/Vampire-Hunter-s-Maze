import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.page});

  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        /*Navigator.push(context, MaterialPageRoute(builder: (context) {
          return
        }));*/
      },
      child: Text(text),
    );
  }
}
