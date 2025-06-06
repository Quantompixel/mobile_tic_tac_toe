import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<int> ticTacToeGrid = [-1, -1, -1, -1, -1, -1, -1, -1, -1];
  int playerId = 0;
  GameState gameState = GameState.running;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  reset();
                });
              },
              child: Text('Reset'),
            ),
            Text('Player ${(playerId + 1).toString()}'),
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
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Builder(
                          builder: (context) {
                            if (ticTacToeGrid[index] == -1) {
                              return SizedBox.expand();
                            } else if (ticTacToeGrid[index] == 0) {
                              return SvgPicture.asset(
                                'assets/icons/circle.svg',
                              );
                            } else {
                              return SvgPicture.asset('assets/icons/cross.svg');
                            }
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (ticTacToeGrid[index] != -1) {
                            return;
                          }

                          ticTacToeGrid[index] = playerId;

                          if (checkForWin()) {
                            gameState = (playerId == 0)
                                ? GameState.winnerPlayer1
                                : GameState.winnerPlayer2;
                            return;
                          }

                          if (checkForDraw()) {
                            gameState = GameState.draw;
                            return;
                          }

                          switchPlayers();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Builder(
          builder: (context) {
            if (gameState == GameState.running) {
              return Offstage();
            }
            return SizedBox.expand(
              child: Card(
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Player ${(gameState == GameState.winnerPlayer1) ? 1 : 2} wins',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            reset();
                          });
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void switchPlayers() {
    playerId = (playerId == 1) ? 0 : 1;
  }

  void setField(int index) {
    if (ticTacToeGrid[index] == -1) {
      ticTacToeGrid[index] = playerId;
    }
  }

  bool checkForDraw() {
    if(checkForWin()) {
      return false;
    }

    for (int index = 0; index < ticTacToeGrid.length; index++) {
      if (ticTacToeGrid[index] == -1) {
        return false;
      }
    }

    return true;
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
      }

      if (counter == 3) {
        return true;
      }
    }
    return false;
  }

  void reset() {
    for (int index = 0; index < ticTacToeGrid.length; index++) {
      ticTacToeGrid[index] = -1;
    }
    gameState = GameState.running;
    playerId = 0;
  }

  String generateEndOfGameText() {
    switch (gameState) {
      case GameState.running:
        return '';
      case GameState.draw:
        return 'Draw - Nobody wins';
      case GameState.winnerPlayer1:
        return 'Player 1 wins the game';
      case GameState.winnerPlayer2:
        return 'Player 2 wins the game';
    }
  }
}

enum GameState { winnerPlayer1, winnerPlayer2, draw, running }
