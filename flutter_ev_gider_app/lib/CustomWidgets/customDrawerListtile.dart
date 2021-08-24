import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawerListtileWidget extends StatelessWidget {
  String name;
  IconData icon;
  Function press;
  CustomDrawerListtileWidget({
    required this.icon,
    required this.name,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => press(),
      title: Text(
        name,
        style: TextStyle(fontSize: 20),
      ),
      contentPadding: EdgeInsets.only(left: 25),
      minLeadingWidth: 3,
      leading: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
