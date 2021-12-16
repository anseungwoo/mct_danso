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
}

Color getMctColor(MctColor mctColor) {
  switch (mctColor) {
    case MctColor.mainBackGround:
      return Color(0xffFAF1E6);
    case MctColor.indiDarkGray:
      return Color(0xffFAF1E6);
    case MctColor.lightYellow:
      return Color(0xffFAF1E6);
    case MctColor.expColor:
      return Color(0xffFAF1E6);
    case MctColor.buttonColorYellow:
      return Color(0xffFAF1E6);
    case MctColor.gradationColorYellow:
      return Color(0xffFAF1E6);
    case MctColor.carouselColor:
      return Color(0xffFAF1E6);
    case MctColor.tapBarColor:
      return Color(0xffFAF1E6);
    case MctColor.appBarColor:
      return Color(0xffFAF1E6);
    case MctColor.white:
      return Color(0xffFAF1E6);
    case MctColor.buttonColorOrange:
      return Color(0xffFAF1E6);
    case MctColor.unButtonColorOrange:
      return Color(0xffFAF1E6);
    case MctColor.dansoCodematchColor:
      return Color(0xffFAF1E6);
    case MctColor.dansoCodeunMatchColor:
      return Color(0xffFAF1E6);
    case MctColor.leftHandColor:
      return Color(0xffFAF1E6);
    case MctColor.rightHandColor:
      return Color(0xffFAF1E6);
    case MctColor.unSelecttapBarColor:
      return Color(0xffFAF1E6);
    default:
      return Color(0xffFFFFFF);
  }
}
