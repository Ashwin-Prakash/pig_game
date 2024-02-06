import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Player extends StatefulWidget {
  const Player(this.playerName, this.score, this.active, {super.key});
  final int score;
  final String playerName;
  final bool active;
  @override
  State<Player> createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              widget.active ? Colors.black : const Color.fromARGB(0, 0, 0, 0),
        ),
        child: Column(
          children: [
            Text(
              widget.playerName,
              style: GoogleFonts.lato(
                fontSize: 32,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "${widget.score}",
              style: GoogleFonts.lato(
                fontSize: 32,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
