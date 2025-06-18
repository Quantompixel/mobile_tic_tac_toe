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
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFDE98),
                    Color(0xFFFFA066)
                  ],
                )),
            child: TicTacToe()
          ),
      ),
    );
  }
}
