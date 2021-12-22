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
    double tempo = 0.0;
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
    int ms = 0;
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
    int ms = 0;
    switch (jangDanType) {
      case JangDanType.semachi:
        // ms = (1+21÷25)/3=0.620666667;
        ms = 620666;
        break;

      case JangDanType.goodGeori:
        ms = 461541;
        // //0.461541667
        break;

      case JangDanType.joongJoongMori:
        ms = 400000;
        break;

      case JangDanType.jajinMori:
        ms = 230750;
        break;

      case JangDanType.huiMori:
        ms = FAST_TEMPO_SEC;
        break;
      case JangDanType.fourByFour:
        ms = 802343;
        break;
      default:
    }
    return ms;
  }

  int getJangdanDelay(JangDanType jangDanType) {
    int delay = 0;
    switch (jangDanType) {
      case JangDanType.semachi:
        // ms = 612638;
        delay = 3797916;
        break;

      case JangDanType.goodGeori:
        delay = 5197916;
        //0.461541667
        break;

      case JangDanType.joongJoongMori:
        delay = 400000;
        break;

      case JangDanType.jajinMori:
        delay = 230000;
        break;

      case JangDanType.huiMori:
        delay = FAST_TEMPO_SEC;
        break;
      case JangDanType.fourByFour:
        delay = MEDIUM_TEMPO_SEC;
        break;
      default:
    }
    return delay;
  }

  @override
  bool operator ==(covariant JangDan other) {
    return (this._jangDanType == other.jangDanType &&
        this._tempo == other.tempo);
  }
}
