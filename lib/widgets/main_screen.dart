import 'package:flutter/material.dart';

import 'package:pig_game/widgets/start_screen.dart';
import 'package:pig_game/widgets/game.dart';
import 'package:pig_game/models/player_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String activeScreen = "start_screen";
  String playerOne = "player 1", playerTwo = "player 2";
  late final List<PlayerInfo> playersList = [
    PlayerInfo(playerOne),
    PlayerInfo(playerTwo),
  ];
  late PlayerInfo firstPlayer = playersList[0];
  late Widget currentScreen = StartScreen(switchScreen);
  void switchScreen() {
    setState(() {
      if (activeScreen == "start_screen") {
        activeScreen = "game";
        activePlayerAnimation();
        currentScreen = Game(playersList, switchScreen);
      }
    });
  }

  void activePlayerAnimation() {
    firstPlayer.active ? firstPlayer.active = false : firstPlayer.active = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 20, 115, 193),
                  Color.fromARGB(255, 255, 210, 77)
                ]),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
