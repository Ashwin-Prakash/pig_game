import 'package:flutter/material.dart';
import 'package:pig_game/widgets/main_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MainScreen());
}
