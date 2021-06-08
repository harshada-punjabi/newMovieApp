import 'package:flutter/material.dart';


class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() => _instance;

  AppColors._internal();

  static const Color backgroundColor = whiteBackground;
  static const Color primaryColor = greenDark;
  static const Color accent = yellowish_orange;
  static const Color whiteForeGroundTransparent =
  Color.fromRGBO(229, 229, 227, 0.95);
  static const Color transparent = Colors.transparent;
  static const Color completeWhite = Colors.white;

  static const Color black = Colors.black;
  static const Color black45 = Colors.black45;
  static const Color black54 = Colors.black54;
  static const Color white = Colors.white; //Color.fromRGBO(252, 252, 250, 1);
  static const Color whiteForeGround = Color.fromRGBO(229, 229, 227, 1);
  static const Color whiteBackground = Color.fromRGBO(213, 213, 212, 1);
  static const Color amber = Colors.amber;
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static const Color orange = Colors.orange;
  static const Color green = Colors.green;
  static const Color indigo = Colors.indigo;
  static const Color deepOrange = Colors.deepOrange;
  static const Color lightGreen = Colors.lightGreen;
  static const Color redAccent = Colors.redAccent;
  static const Color yellow = Colors.yellow;
  static const Color blueAccent = Colors.blueAccent;
  static const Color orangeAccent = Colors.orangeAccent;
  static const Color indigoAccent = Colors.indigoAccent;
  static const Color lightBlue = Colors.lightBlue;
  static const Color deepPurpleAccent = Colors.deepPurpleAccent;

  static const Color vividYellow = Color.fromRGBO(195, 230, 23, 1);
  static const Color greenDark = Color.fromRGBO(46, 139, 53, 1);
  static const Color gray = Color.fromRGBO(177, 177, 177, 1);
  static const Color veryDarkGray = Color.fromRGBO(48, 48, 48, 1);
  static const Color veryDarkGray2 = Color.fromRGBO(112, 112, 112, 1);
  static const Color darkGray = Color.fromRGBO(62, 62, 62, 1);
  static const Color transparentBlack = Color.fromRGBO(0, 0, 0, 0.75);
  static const Color veryDarkYellow = Color.fromRGBO(33, 33, 33, 1);
  static const Color brightRed = Color.fromRGBO(238, 69, 69, 1);
  static const Color veryLightGray = Color.fromRGBO(219, 219, 219, 1);
  static const Color greyishBrown = Color.fromRGBO(112, 112, 112, 1);
  static const Color moderateRed = Color.fromRGBO(201, 72, 73, 1);
  static const Color veryDarkGray1 = Color.fromRGBO(56, 56, 56, 1);

  static const Color whiteDim = Color.fromRGBO(219, 219, 219, 1);
  static const Color whiteFade = Color.fromRGBO(243, 241, 241, 1);
  static const Color errorRed = Color.fromRGBO(238, 69, 69, 1);
  static const Color drawerBlack = Color.fromRGBO(33, 33, 33, 1);
  static const Color lightGreyBrown = Color.fromRGBO(184, 184, 184, 1);
  static const Color turquoise = Color.fromRGBO(0, 195, 169, 1);
  static const Color darkishGreen = Color.fromRGBO(46, 139, 53, 1);
  static const Color brownishGrey = Color.fromRGBO(112, 112, 112, 1);
  static const Color yellowish_orange = Color.fromRGBO(250, 160, 16, 1);
  static const Color warm_grey = Color.fromRGBO(147, 147, 147, 1);
  static const Color very_light_pink = Color.fromRGBO(213, 213, 213, 1);
  static const Color very_light_pink_two = Color.fromRGBO(187, 187, 187, 1);
  static const Color very_light_pink_three = Color.fromRGBO(202, 202, 202, 1);
  static const Color charcoal = Color.fromRGBO(56 ,62, 59,1);
  static const Color whiteThree = Color.fromRGBO(223 ,223, 223,1);
  static const Color whiteTwo = Color.fromRGBO(236 ,236, 236,1);
  static const Color darkSeaGreen = Color.fromRGBO(22 ,156, 72,1);
  static const Color brownishOrange = Color.fromRGBO(196 ,118, 39,1);
  static const Color camoGreen = Color.fromRGBO(55 ,32, 31,1);
  static const Color whiteFour = Color.fromRGBO(216 ,216, 216,1);
  static const Color whiteFive = Color.fromRGBO(246 ,246, 246,1);
  static const Color darkBlueGreen = Color.fromRGBO(35 ,101, 114,1);

  static Color fromHex(String hex) {
    try {
      return Color(int.parse(hex.replaceAll("#", "0xff")));
    } catch (e) {
      print("Color convert error");
      return AppColors.accent;
    }
  }
}
