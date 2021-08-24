import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFabButton extends StatelessWidget {
  VoidCallback? press;

  CustomFabButton({required this.press});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: press,
      child: Container(
        width: 50,
        height: 50,
        child: Icon(
          Icons.add,
          size: 35,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.purple]),
        ),
      ),
    );
  }
}
