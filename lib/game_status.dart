import 'package:flutter/material.dart';

class GameStatus extends StatefulWidget {
  const GameStatus({super.key, required this.statusText, required this.onPress});
  final String statusText;
  final Function onPress;

  @override
  State<GameStatus> createState() => _GameStatusState();
}

class _GameStatusState extends State<GameStatus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Card(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.statusText,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.onPress();
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
