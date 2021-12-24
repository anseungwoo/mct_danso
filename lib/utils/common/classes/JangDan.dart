//장단 enum과 빠르기 정의 해 놓아야 함

import 'package:project_danso/utils/danso_function.dart';

class JangDan {
  JangDanType _jangDanType = JangDanType.semachi;
  double _tempo = MEDIUM_TEMPO;
  int _milliSecond = MEDIUM_TEMPO_SEC;
  int _microSecond = 0;
  int _delay = 0;
  JangDan(JangDanType jangDanType) {
    _jangDanType = jangDanType;
    _tempo = getTempo(jangDanType);
    _milliSecond = getMilliSecond(jangDanType);
    _microSecond = getMicrosecond(jangDanType);
    _delay = getJangdanDelay(jangDanType);
  }

  JangDanType get jangDanType => _jangDanType;
  double get tempo => _tempo;
  int get milliSecond => _milliSecond;
  int get microSecond => _microSecond;
  int get delay => _delay;

  void setJangDanType(JangDanType jangDanType) {
    _jangDanType = jangDanType;
  }

  double getTempo(JangDanType jangDanType) {
    var tempo = 0.0;
    switch (jangDanType) {
      case JangDanType.semachi:
        tempo = MEDIUM_TEMPO;
        break;

      case JangDanType.goodGeori:
        tempo = MEDIUM_TEMPO;
        break;

      case JangDanType.joongJoongMori:
        tempo = SLOW_TEMPO;
        break;

      case JangDanType.jajinMori:
        tempo = FAST_TEMPO;
        break;

      case JangDanType.huiMori:
        tempo = FAST_TEMPO;
        break;

      case JangDanType.fourByFour:
        tempo = MEDIUM_TEMPO;
        break;
      default:
    }
    return tempo;
  }

  int getMilliSecond(JangDanType jangDanType) {
    var ms = 0;
    switch (jangDanType) {
      case JangDanType.semachi:
        ms = MEDIUM_TEMPO_SEC;
        break;

      case JangDanType.goodGeori:
        ms = MEDIUM_TEMPO_SEC;
        break;

      case JangDanType.joongJoongMori:
        ms = SLOW_TEMPO_SEC;
        break;

      case JangDanType.jajinMori:
        ms = FAST_TEMPO_SEC;
        break;

      case JangDanType.huiMori:
        ms = FAST_TEMPO_SEC;
        break;
      case JangDanType.fourByFour:
        ms = MEDIUM_TEMPO_SEC;
        break;
      default:
    }
    return ms;
  }

  int getMicrosecond(JangDanType jangDanType) {
    var ms = 0;
    switch (jangDanType) {
      case JangDanType.semachi:
        // ms = (1+(44÷80+21)÷25)÷3=0.620666667;
        ms = 620666;
        break;

      case JangDanType.goodGeori:
        ms = 461541;
        //(5+(37÷80+13)÷25)÷12=0.461541667
        break;

      case JangDanType.joongJoongMori:
        ms = 400000;
        //=400000
        break;

      case JangDanType.jajinMori:
        ms = 230750;
        //(2+(18÷80+19)÷25)÷12=0.23075
        break;

      case JangDanType.huiMori:
        ms = FAST_TEMPO_SEC;
        break;
      case JangDanType.fourByFour:
        ms = 645125;
        // (2+(41÷80+14)÷25)÷4=0.645125
        break;
      default:
    }
    return ms;
  }

  int getJangdanDelay(JangDanType jangDanType) {
    var delay = 0;
    switch (jangDanType) {
      case JangDanType.semachi:
        //
        delay = 3697916;
        break;

      case JangDanType.goodGeori:
        delay = 5400000;
        //
        break;

      case JangDanType.joongJoongMori:
        delay = 4700000;
        break;

      case JangDanType.jajinMori:
        delay = 2800000;
        break;

      case JangDanType.huiMori:
        delay = FAST_TEMPO_SEC;
        break;
      case JangDanType.fourByFour:
        delay = 2300000;
        break;
      default:
    }
    return delay;
  }

  @override
  bool operator ==(covariant JangDan other) {
    return (_jangDanType == other.jangDanType && _tempo == other.tempo);
  }
}
