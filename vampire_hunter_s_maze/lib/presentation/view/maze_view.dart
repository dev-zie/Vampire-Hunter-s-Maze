import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MazeView extends StatefulWidget {
  final int step;
  const MazeView({super.key, this.step = 0});

  @override
  State<MazeView> createState() => _MazeViewState();
}

class _MazeViewState extends State<MazeView> {
  final correctPath = ['up', 'right', 'right', 'down', 'left', 'up', 'left'];
  late int currentStep;

  @override
  void initState() {
    super.initState();
    currentStep = widget.step;
  }

  void handlePress(String direction) {
    if (direction != correctPath[currentStep]) {
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("You're trapped"),
            content: const Text("Try Again!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        },
      );
      currentStep = 0;
      return;
    } else {
      setState(() {
        currentStep++;
      });
    }

    if (currentStep == correctPath.length) {
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Congratulations"),
            content: const Text("You did it!!!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  currentStep = 0;
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      return;
    }
    Navigator.of(context).push(_routeByDirection(direction, currentStep));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Text(currentStep.toString()),
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/labrent.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => handlePress('up'),
                        icon: const Icon(
                          Icons.arrow_circle_up,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () => handlePress('left'),
                            icon: const Icon(
                              Icons.arrow_circle_left_outlined,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                          Hero(
                            tag: 'hero',
                            child: Image.asset(
                              'assets/images/robloxavatar.png',
                              width: 200,
                            ),
                          ),
                          IconButton(
                            onPressed: () => handlePress('right'),
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => handlePress('down'),
                        icon: const Icon(
                          Icons.arrow_circle_down,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: strict_raw_type
Route _routeByDirection(String direction, int step) {
  return PageRouteBuilder(
    pageBuilder: (_, _, _) => MazeView(step: step),
    transitionsBuilder: (_, animation, _, child) {
      switch (direction) {
        case 'up':
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );

        case 'right':
          return ScaleTransition(
            scale: animation,
            child: SlideTransition(
              position: Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );

        case 'left':
          return SlideTransition(
            position: Tween(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );

        case 'down':
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );

        default:
          return child;
      }
    },
  );
}
