import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key, required this.onPress});
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: BoxDecoration(
          color: const Color(0xFF462713),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 4,
              offset: Offset(0, 4)
            )
          ]
        ),
        child: Center(child: SvgPicture.asset('assets/icons/reset.svg')),
      ),
    );
  }
}
