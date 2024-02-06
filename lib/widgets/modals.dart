import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pig_game/models/player_info.dart';

class Modals extends StatefulWidget {
  const Modals({required this.switchScreen, required this.players, super.key});
  final List<PlayerInfo> players;
  final void Function() switchScreen;
  @override
  State<Modals> createState() => _ModalsState();
}

class _ModalsState extends State<Modals> {
  final TextEditingController tc1 = TextEditingController();
  final TextEditingController tc2 = TextEditingController();
  @override
  void dispose() {
    tc1.dispose();
    tc2.dispose();
    super.dispose();
  }

  closeModalOverlay() {
    Navigator.pop(context);
  }

  void startGame() {
    setState(() {
      widget.players[0].playerName = tc1.text;
      widget.players[1].playerName = tc2.text;
      closeModalOverlay();
      widget.switchScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: tc1,
          decoration: InputDecoration(
            label: Text(
              "Enter players1's name",
              style: GoogleFonts.lato(),
            ),
          ),
        ),
        TextField(
          controller: tc2,
          decoration: InputDecoration(
            label: Text(
              "Enter players2's name",
              style: GoogleFonts.lato(),
            ),
          ),
        ),
        ElevatedButton(onPressed: startGame, child: const Text("Play"))
      ],
    );
  }
}
