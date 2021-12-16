enum SongSpeed { eight, nine, ten, eleven, twelve }
enum MctSize {
  seven,
  eight,
  nine,
  ten,
  eleven,
  twelve,
  thirteen,
  fourteen,
  fifteen,
  sixteen,
  seventeen,
  eighteen,
  nineteen,
  twenty,
  twentyOne,
  twentyTwo,
  twentyThree,
  twentyFour,
  twentyfive,
  jungWidth,
  jungHeight,
  jungSixHeight,
  jungEightHeight,
}
double getSpeed(SongSpeed songSpeed) {
  switch (songSpeed) {
    case SongSpeed.eight:
      return 0.8;
    case SongSpeed.nine:
      return 0.9;
    case SongSpeed.ten:
      return 1.0;
    case SongSpeed.eleven:
      return 1.1;
    case SongSpeed.twelve:
      return 1.2;
    default:
      return 1.0;
  }
}

extension MctSizeExtension on MctSize {
  double get getSize {
    switch (this) {
      case MctSize.seven:
        return 7.0;
      case MctSize.eight:
        return 8.0;
      case MctSize.nine:
        return 9.0;
      case MctSize.ten:
        return 10.0;
      case MctSize.eleven:
        return 11.0;
      case MctSize.twelve:
        return 12.0;
      case MctSize.thirteen:
        return 13.0;
      case MctSize.fourteen:
        return 14.0;
      case MctSize.fifteen:
        return 15.0;
      case MctSize.sixteen:
        return 16.0;
      case MctSize.seventeen:
        return 17.0;
      case MctSize.eighteen:
        return 18.0;
      case MctSize.nineteen:
        return 19.0;
      case MctSize.twenty:
        return 20.0;
      case MctSize.twentyOne:
        return 21.0;
      case MctSize.twentyTwo:
        return 22.0;
      case MctSize.twentyThree:
        return 23.0;
      case MctSize.twentyFour:
        return 24.0;
      case MctSize.twentyfive:
        return 25.0;
      case MctSize.jungWidth:
        return 64.0;
      case MctSize.jungEightHeight:
        return 62.0;
      case MctSize.jungHeight:
        return 35.0;
      case MctSize.jungSixHeight:
        return 82.0;

      default:
        return 1.0;
    }
  }
}
