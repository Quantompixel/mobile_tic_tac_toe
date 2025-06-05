import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  /// Our “static” starting grid.
  static List<int> ticTacToeGrid = [-1, -1, -1, -1, -1, -1, -1, -1, -1];
  static final ticTacToeGridNotifier = TicTacToeGridNotifier(ticTacToeGrid);
  static ValueNotifier<int> playerIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    ticTacToeGridNotifier.reset();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Tic Tac Toe')),
        body: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: playerIndexNotifier,
              builder: (context, value, child) {
                return Text('Player ${(value + 1).toString()}');
              },
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, 
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Center(
                    child: TextButton(
                      // Rebuild each cell whenever the notifier changes.
                      child: ListenableBuilder(
                        listenable: ticTacToeGridNotifier,
                        builder: (context, child) {
                          return Text(
                            ticTacToeGridNotifier.ticTacToeGrid[index].toString(),
                            style: const TextStyle(fontSize: 24),
                          );
                        },
                      ),
                      onPressed: () {
                        ticTacToeGridNotifier.setField(index, playerIndexNotifier.value);
                        playerIndexNotifier.value = (playerIndexNotifier.value == 1) ? 0 : 1;
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicTacToeGridNotifier extends ChangeNotifier {
  final List<int> _ticTacToeGrid;
  TicTacToeGridNotifier(this._ticTacToeGrid);

  List<int> get ticTacToeGrid => _ticTacToeGrid;

  void setField(int index, int playerIndex) {
    // Example toggle logic; adjust to your own game logic.
    if(ticTacToeGrid[index] == -1) {
      ticTacToeGrid[index] = playerIndex;
    }
    checkForWin();
    notifyListeners();
  }

  bool checkForWin() {
    List<List<int>> winningPositions = [
      // rows
      [1, 1, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 1, 1, 1],
      // columns
      [1, 0, 0, 1, 0, 0, 1, 0, 0],
      [0, 1, 0, 0, 1, 0, 0, 1, 0],
      [0, 0, 1, 0, 0, 1, 0, 0, 1],
      // Cross
      [1, 0, 0, 0, 1, 0, 0, 0, 1],
      [0, 0, 1, 0, 1, 0, 1, 0, 0],
    ];

    for(int positionIndex = 0; positionIndex < winningPositions.length; positionIndex++) {
      List<int> winningPosition = winningPositions[positionIndex];
      int firstFieldClaimedByPlayer = -1;
      int counter = 0;

      for(int fieldIndex = 0; fieldIndex < winningPosition.length; fieldIndex++) {
        if(winningPosition[fieldIndex] == 0) continue;
        if(ticTacToeGrid[fieldIndex] == -1) break;

        int field = ticTacToeGrid[fieldIndex];
        if(firstFieldClaimedByPlayer == -1) {
          firstFieldClaimedByPlayer = field;
        }

        if(field != firstFieldClaimedByPlayer) break;

        counter++;

        print('DEBUG | c: $counter, f: $field, $winningPosition, $firstFieldClaimedByPlayer');
      }

      if(counter == 3) {
        print('WIN: $winningPosition, $firstFieldClaimedByPlayer');
        return true;
      }
    }
    return false;
  }

  void reset() {
    for(int index = 0; index < ticTacToeGrid.length; index++) {
      ticTacToeGrid[index] = -1;
      notifyListeners();
    }
  }
}
