import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pig_game/widgets/player.dart';
import 'package:pig_game/widgets/button.dart';
import 'package:pig_game/models/player_info.dart';
import 'package:pig_game/widgets/victor.dart';

class Game extends StatefulWidget {
  const Game(this.players, this.switchScreen, {super.key});
  final List<PlayerInfo> players;
  final void Function() switchScreen;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int dice = 6, currentScore = 0;
  bool isPlaying = true;
  late PlayerInfo activePlayer = widget.players[0];

  void aniamtePlayer() {
    for (PlayerInfo player in widget.players) {
      player.toggleActiveState();
    }
  }

  void startingAnimation() {
    dice = 6;
    currentScore = 0;
    widget.players[0].active = true;
    widget.players[1].active = false;
  }

  void rollDice() {
    setState(() {
      dice = Random().nextInt(5) + 1;
      dice == 1
          ? {switchActivePlayer(), aniamtePlayer()}
          : currentScore += dice;
    });
  }

  void restartGame() {
    setState(() {
      startingAnimation();
      dice = 6;
      currentScore = 0;
      isPlaying = true;
      activePlayer = widget.players[0];
      for (PlayerInfo player in widget.players) {
        player.score = 0;
      }
    });
  }

  void switchActivePlayer() {
    activePlayer == widget.players[0]
        ? activePlayer = widget.players[1]
        : activePlayer = widget.players[0];
    currentScore = 0;
  }

  void holdScore() {
    setState(() {
      activePlayer.score += currentScore;
      if (activePlayer.score > 50) {
        isPlaying = false;
        showModalBottomSheet(
          context: context,
          builder: (ctx) => Victor(activePlayer, restartGame),
        );
      } else {
        aniamtePlayer();
        switchActivePlayer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...widget.players.map(
                (e) => Player(e.playerName, e.score, e.active),
              ),
            ],
          ),
          Text(
            "Score",
            style: GoogleFonts.lato(
                fontSize: 64, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "$currentScore",
            style: GoogleFonts.lato(
                fontSize: 64, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Button(isPlaying: isPlaying, holdScore, "Hold"),
          Image.asset(
            "assest/dice-$dice.png",
            height: 150,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(rollDice, "Roll Dice"),
              const SizedBox(
                width: 8,
              ),
              Button(restartGame, "Restart"),
            ],
          ),
        ],
      ),
    );
  }
}
