import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  const Button(this.btnFunc, this.label, {this.isPlaying = true, super.key});
  final bool isPlaying;
  final void Function() btnFunc;
  final String label;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isPlaying ? widget.btnFunc : null,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          widget.isPlaying
              ? const Color.fromARGB(255, 20, 115, 193)
              : Colors.grey,
        ),
      ),
      child: Text(
        widget.label,
        style:
            GoogleFonts.lato(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
