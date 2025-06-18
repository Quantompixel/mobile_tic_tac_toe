import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetButton extends StatefulWidget {
  const ResetButton({super.key, required this.onPress});
  final Function onPress;

  @override
  State<ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  double _turns = 0.0;

  void _animate() {
    // rotate 0.1 turns (~36°) to the right
    setState(() => _turns = 0.1);
    // then rotate back after 150ms
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) setState(() => _turns = 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
        Feedback.forTap(context);
        _animate();
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: const Color(0xFF462713),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: AnimatedRotation(
            turns: _turns,
            duration: Duration(milliseconds: 150),
            curve: Curves.easeOut,
            child: SvgPicture.asset(
              'assets/icons/reset.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
