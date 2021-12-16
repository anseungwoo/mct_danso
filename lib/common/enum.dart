enum SongSpeed { eight, nine, ten, eleven, twelve }

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

enum DansoCode { joog, lim, moo, hawng, tae, highTae }

String getDansoCodePng(DansoCode dansoCode) {
  switch (dansoCode) {
    case DansoCode.joog:
      return 'assets/images/danso_code/중.png';
    case DansoCode.lim:
      return 'assets/images/danso_code/임.png';
    case DansoCode.moo:
      return 'assets/images/danso_code/무.png';
    case DansoCode.hawng:
      return 'assets/images/danso_code/황.png';
    case DansoCode.tae:
      return 'assets/images/danso_code/태.png';
    case DansoCode.highTae:
      return 'assets/images/danso_code/높은_태.png';
    default:
      return "";
  }
}

String getDansoCodeTitle(DansoCode dansoCode) {
  switch (dansoCode) {
    case DansoCode.joog:
      return '仲 & 㳞(중)';
    case DansoCode.lim:
      return '林 & 淋(임)';
    case DansoCode.moo:
      return '無 & 潕(무)';
    case DansoCode.hawng:
      return '潢 & 㶂(황)';
    case DansoCode.tae:
      return '汰(태)';
    case DansoCode.highTae:
      return '㳲(태)';
    default:
      return "";
  }
}

String getDansoCodeContant(DansoCode dansoCode) {
  switch (dansoCode) {
    case DansoCode.joog:
      return '1~4공까지의 지공을 막고, 5공은 열고 소리를 냅니다. 仲은 "낮은소리"를 낼 때의 입김으로,  㳞은 "가운데소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.lim:
      return '1~3공까지의  지공을 막고, 4공과 5공은 열고 소리를 냅니다. 林은 "낮은소리"를 낼 때의 입김으로,  淋은 "가운데소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.moo:
      return '1~2공까지의  지공을 막고, 3~5공은 열고 소리를 냅니다. 無는 "가운데소리"를 낼 때의 입김으로,  潕는 "높은소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.hawng:
      return '1공의  지공을 막고, 2~5공은 열고 소리를 냅니다. 潢은 "가운데소리"를 낼 때의 입김으로,  㶂은 "높은소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.tae:
      return '1~5공의 지공을 모두 열고  소리를 냅니다. 汰는 "가운데소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.highTae:
      return '1공과 3공은 막고, 2공과 4공, 5공은 열고 소리를 냅니다. 㳲는 "높은소리"를 낼 때의 입김으로 연주합니다.';
    default:
      return "";
  }
}
