import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/constants/const.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHomeCard extends StatelessWidget {
  final String name;
  final String image;
  final Function press;
  const CustomHomeCard({
    Key? key,
    required this.size,
    required this.name,
    required this.image,
    required this.press,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * .26,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CHomeCard,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SvgPicture.asset(
              image,
              fit: BoxFit.cover,
              width: 90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: CAppBar,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => press(),
                      icon: Icon(
                        Icons.double_arrow,
                        color: CWhite,
                        size: 45,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
