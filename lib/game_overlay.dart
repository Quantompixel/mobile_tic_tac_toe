import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameOverlay extends StatefulWidget {
  const GameOverlay({
    super.key,
    required this.winnerPlayerId,
    required this.onPress,
  });
  final int winnerPlayerId;
  final Function onPress;

  @override
  State<GameOverlay> createState() => _GameOverlayState();
}

class _GameOverlayState extends State<GameOverlay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Card(
        color: Color(0xFFFFEDC5).withAlpha(200),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Builder(
                  builder: (context) {
                    if (widget.winnerPlayerId == 0) {
                      return SvgPicture.asset(
                        'assets/icons/cross.svg',
                        width: 25,
                        height: 25,
                      );
                    } else if (widget.winnerPlayerId == 1) {
                      return SvgPicture.asset(
                        'assets/icons/circle.svg',
                        width: 25,
                        height: 25,
                      );
                    } else {
                      return Offstage();
                    }
                  },
                ),
                Text(
                  (widget.winnerPlayerId == -1) ? 'NO WINNER' : 'WINS',
                  style: TextStyle(
                    color: Color(0xFF462713),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            GestureDetector(
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF462713),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'NEW GAME',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFDE98),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  widget.onPress();
                  Feedback.forTap(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
