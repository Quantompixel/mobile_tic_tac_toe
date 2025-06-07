import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Field extends StatelessWidget {
  const Field({super.key, required this.fieldType, required this.onPress});
  final int fieldType;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Builder(
          builder: (context) {
            if (fieldType == -1) {
              return SizedBox.expand();
            } else if (fieldType == 0) {
              return SvgPicture.asset('assets/icons/circle.svg');
            } else {
              return SvgPicture.asset('assets/icons/cross.svg');
            }
          },
        ),
      ),
      onPressed: () {
        onPress();
      },
    );
  }
}
