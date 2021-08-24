import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/constants/const.dart';

class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CHomeBackground,
        child: Material(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 48,
              ),
              CustomDrawerListtileWidget(
                icon: Icons.person,
                name: "Profile",
                press: () {},
              ),
              CustomDrawerListtileWidget(
                icon: Icons.logout,
                name: "Sİgn Out",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
