import 'package:flutter/material.dart';

const Color CAppBar = Color(0xFF991FBF);
const Color CHomeBackground = Color(0xFFF3F1F5);
const Color CHomeCard = Color(0xFFF0D9FF);
const Color CDrawer = Color(0xFFF3F1F5);
const Color CWhite = Colors.white;

const Color CpieTayyip = Color(0xFF11052C);
const Color CpieEmin = Color(0xFF3D087B);
const Color CpieYusuf = Color(0xFFF43B86);
const Color CpieEmir = Color(0xFFFFE459);

class ScreenUtil {
  static double width = 0.0;
  static double height = 0.0;
}

void initializeConstants(BuildContext context) {
  ScreenUtil.width = MediaQuery.of(context).size.width;
  ScreenUtil.height = MediaQuery.of(context).size.height;
}
