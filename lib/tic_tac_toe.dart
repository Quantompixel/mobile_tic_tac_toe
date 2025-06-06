import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key, required this.onWin});
  final ValueChanged<int> onWin;

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<int> ticTacToeGrid = [-1, -1, -1, -1, -1, -1, -1, -1, -1];
  int playerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              reset();
            });
          },
          child: Text('Reset'),
        ),
        Text('Player ${(playerIndex + 1).toString()}'),
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
                child: ElevatedButton(
                  // Rebuild each cell whenever the notifier changes.
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Builder(
                      builder: (context) {
                        if (ticTacToeGrid[index] == -1) {
                          return SizedBox();
                        } else if (ticTacToeGrid[index] == 0) {
                          return SvgPicture.asset('assets/icons/circle.svg');
                        } else {
                          return SvgPicture.asset('assets/icons/cross.svg');
                        }
                      },
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (ticTacToeGrid[index] == -1) {
                        ticTacToeGrid[index] = playerIndex;
                        // Check win first, then switch players if no win, etc.
                        bool didWin = checkForWin();
                        if (!didWin) {
                          playerIndex = 1 - playerIndex;
                        } else {
                          widget.onWin(playerIndex);
                          // You might want to pop up a dialog or something to announce the win.
                        }
                      }
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void switchPlayers() {
    playerIndex = (playerIndex == 1) ? 0 : 1;
  }

  void setField(int index) {
    // Example toggle logic; adjust to your own game logic.
    if (ticTacToeGrid[index] == -1) {
      ticTacToeGrid[index] = playerIndex;
    }
    checkForWin();
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

    for (
      int positionIndex = 0;
      positionIndex < winningPositions.length;
      positionIndex++
    ) {
      List<int> winningPosition = winningPositions[positionIndex];
      int firstFieldClaimedByPlayer = -1;
      int counter = 0;

      for (
        int fieldIndex = 0;
        fieldIndex < winningPosition.length;
        fieldIndex++
      ) {
        if (winningPosition[fieldIndex] == 0) continue;
        if (ticTacToeGrid[fieldIndex] == -1) break;

        int field = ticTacToeGrid[fieldIndex];
        if (firstFieldClaimedByPlayer == -1) {
          firstFieldClaimedByPlayer = field;
        }

        if (field != firstFieldClaimedByPlayer) break;

        counter++;

        print(
          'DEBUG | c: $counter, f: $field, $winningPosition, $firstFieldClaimedByPlayer',
        );
      }

      if (counter == 3) {
        print('WIN: $winningPosition, $firstFieldClaimedByPlayer');
        return true;
      }
    }
    return false;
  }

  void reset() {
    for (int index = 0; index < ticTacToeGrid.length; index++) {
      ticTacToeGrid[index] = -1;
    }
  }
}
