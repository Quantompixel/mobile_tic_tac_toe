import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameStatus extends StatelessWidget {
  const GameStatus({super.key, required this.playerId});
  final int playerId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFFCC8051),
          ),
          'TURN OF PLAYER',
        ),
        Builder(
          builder: (context) {
            if (playerId == 0) {
              return SvgPicture.asset(
                'assets/icons/cross.svg',
                width: 35,
                height: 35,
                colorFilter: ColorFilter.mode(
                  Color(0xFFCC8051),
                  BlendMode.srcIn,
                ),
              );
            } else {
              return SvgPicture.asset(
                'assets/icons/circle.svg',
                width: 35,
                height: 35,
                colorFilter: ColorFilter.mode(
                  Color(0xFFCC8051),
                  BlendMode.srcIn,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
