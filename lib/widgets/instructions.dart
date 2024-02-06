import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    final List instruct = [
      "Each turn, a player repeatedly rolls a die until either a 1 is rolled or the player decides to \"hold\":",
      "If the player rolls a 1, they score nothing and it becomes the next player's turn.",
      "If the player rolls any other number, it is added to their turn total and the player's turn continues.",
      "If a player chooses to \"hold\", their turn total is added to their score, and it becomes the next player's turn.",
      "The first player to score 50 or more points wins."
    ];
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(62, 248, 47, 218),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "INSTRUCTIONS",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...instruct.map((data) {
              return (Column(
                children: [
                  Text(
                    data,
                    style: GoogleFonts.lato(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ));
            }),
          ],
        ),
      ),
    );
  }
}
