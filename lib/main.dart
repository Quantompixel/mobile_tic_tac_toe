// https://docs.flutter.dev/get-started/fundamentals/state-management

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  // var ticTacToeGrid = [0, 0, 0, 1, 1, 1, 0, 1, 0];
  var ticTacToeGridNotifier = TicTacToeGridNotifier();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('My Page')),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // three items per row
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: 9, // 3 rows × 3 columns
          itemBuilder: (context, index) {
            return Center(
              child: TextButton(
                child: ListenableBuilder(
                  listenable: ticTacToeGridNotifier,
                  builder: (context, child) {
                    return Text(ticTacToeGridNotifier.ticTacToeGrid[index].toString());
                  },
                ),
                onPressed: () {
                  ticTacToeGridNotifier.setField(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
class TicTacToeButton extends StatelessWidget {
  TicTacToeButton({super.key});
  var ticTacToeGridNotifier = TicTacToeGridNotifier();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: ListenableBuilder(
        listenable: ticTacToeGridNotifier,
        builder: builder
      ),
    );
  }
}*/

class TicTacToeGridNotifier extends ChangeNotifier {
  final List<int> _ticTacToeGrid = [0, 0, 0, 1, 1, 1, 0, 1, 0];
  List<int> get ticTacToeGrid => _ticTacToeGrid;

  void setField(index) {
    _ticTacToeGrid[index] = (_ticTacToeGrid[index] == 1) ? 0 : 1;
    notifyListeners();
  }
}
