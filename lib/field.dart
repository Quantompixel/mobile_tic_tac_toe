import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Field extends StatelessWidget {
  const Field({super.key, required this.fieldType, required this.onPress});
  final int fieldType;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
        Feedback.forTap(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Color(0xFF965D3A)),
            BoxShadow(
              color: Color(0xFFCC8051),
              spreadRadius: -1.0,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.all(5),
        child: Builder(
          builder: (context) {
            if (fieldType == -1) {
              return SizedBox.expand();
            } else if (fieldType == 0) {
              return Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: SizedBox.expand(
                  child: SvgPicture.asset('assets/icons/cross.svg'),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: SizedBox.expand(
                  child: SvgPicture.asset('assets/icons/circle.svg'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
