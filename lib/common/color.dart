import 'package:flutter/cupertino.dart';

enum MctColor {
  mainBackGround,
  indiDarkGray,
  lightYellow,
  expColor,
  buttonColorYellow,
  gradationColorYellow,
  carouselColor,
  tapBarColor,
  appBarColor,
  white,
  buttonColorOrange,
  unButtonColorOrange,
  dansoCodematchColor,
  dansoCodeunMatchColor,
  leftHandColor,
  rightHandColor,
  unSelecttapBarColor,
  black,
}

extension MctColorExtension on MctColor {
  Color get getMctColor {
    switch (this) {
      case MctColor.mainBackGround: //z
        return Color(0xffFAF1E6);
      case MctColor.indiDarkGray: //z
        return Color(0xffECECEC);
      case MctColor.lightYellow:
        return Color(0xffEFBE50);
      case MctColor.expColor: //z
        return Color(0xffFCDF9C);
      case MctColor.buttonColorYellow: //z
        return Color(0xffFFB85E);
      case MctColor.gradationColorYellow: //z
        return Color(0xffFFFBDE);
      case MctColor.carouselColor: //z
        return Color(0xffE39D00);
      case MctColor.tapBarColor: //z
        return Color(0xffC48535);
      case MctColor.appBarColor: //z
        return Color(0xff302414);
      case MctColor.white: //z
        return Color(0xffFFFFFF);
      case MctColor.buttonColorOrange: //z
        return Color(0xffF19929);
      case MctColor.unButtonColorOrange: //z
        return Color(0xffFEC782);
      case MctColor.dansoCodematchColor: //z
        return Color(0xff00A8F2);
      case MctColor.dansoCodeunMatchColor: //z
        return Color(0xffFE0000);
      case MctColor.leftHandColor: //z
        return Color(0xffFFA200);
      case MctColor.rightHandColor: //z
        return Color(0xff00CDD5);
      case MctColor.unSelecttapBarColor: //z
        return Color(0xffFBCF98);
      case MctColor.black: //z
        return Color(0xff222222);
      default:
        return Color(0xffFFFFFF);
    }
  }
}
