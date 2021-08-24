import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/constants/const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CAppBar,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 3,
                left: 55,
              ),
              child: Row(
                children: [
                  Text(
                    "Hoş",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                  Text(
                    "geldin",
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
