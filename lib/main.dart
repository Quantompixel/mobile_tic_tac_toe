import 'package:flutter/material.dart';
import 'package:mobile_tic_tac_toe/tic_tac_toe.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Tic Tac Toe')),
        body: TicTacToe(),
      ),
    );
  }
}
