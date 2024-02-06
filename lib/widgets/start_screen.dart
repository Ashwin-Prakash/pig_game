import 'package:flutter/material.dart';
import 'package:pig_game/widgets/instructions.dart';

import 'package:pig_game/widgets/button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Instructions(),
            Button(switchScreen, "Play"),
          ],
        ),
      ),
    );
  }
}
