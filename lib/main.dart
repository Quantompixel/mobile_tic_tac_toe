import 'package:flutter/material.dart';
import 'package:mobile_tic_tac_toe/tic_tac_toe.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static ValueNotifier<int> winNotifier = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Tic Tac Toe')),
        body: Stack(
          children: [
            TicTacToe(
              onWin: (winnerPlayerId) {
                winNotifier.value = winnerPlayerId;
              },
            ),
            ValueListenableBuilder(
              valueListenable: winNotifier,
              builder: (context, winnerPlayerId, child) {
                if (winnerPlayerId == -1) return Offstage();
                return SizedBox.expand(
                  child: Card(
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player $winnerPlayerId wins',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        TextButton(
                          onPressed: () {print('RESET');},
                          child: const Text('Reset'),
                        ),
                      ], //Text
                    ), //Center
                  ), //Card
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
