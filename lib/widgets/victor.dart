import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pig_game/models/player_info.dart';
// import 'package:pig_game/models/player_info.dart';

class Victor extends StatefulWidget {
  const Victor(this.winner, this.restartGame, {super.key});
  final PlayerInfo winner;
  final void Function() restartGame;

  @override
  State<Victor> createState() => _VictorState();
}

class _VictorState extends State<Victor> {
  closeModalOverlay() {
    widget.restartGame();

    Navigator.pop(context);
  }

  late String score = widget.winner.score.toString();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "The Winner is",
              style: GoogleFonts.lato(fontSize: 32),
            ),
            Text(
              widget.winner.playerName,
              style: GoogleFonts.lato(fontSize: 32),
            ),
            Text(
              "Score : $score",
              style: GoogleFonts.lato(fontSize: 50),
            ),
            // Text(score),
          ],
        ),
      ),
    );
  }
}
