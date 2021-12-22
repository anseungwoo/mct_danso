enum AudioFile { JoongJoong, Jagin, Huimori, Good, Semachi, BackGroundMusic }

String getAudioFilePath(AudioFile audioFile) {
  switch (audioFile) {
    case AudioFile.JoongJoong:
      return 'assets/music/joongjoong.mp3';
    case AudioFile.Jagin:
      return 'assets/music/jajin.mp3';
    case AudioFile.Huimori:
      return 'assets/music/huimori.mp3';
    case AudioFile.Good:
      return 'assets/music/good.mp3';
    case AudioFile.Semachi:
      return 'assets/music/semachi.mp3';
    case AudioFile.BackGroundMusic:
      return 'assets/music/danso_arirang_mixed.mp3';
    default:
      return "";
  }
}

String getSongFilePath(String songName) {
  var path_level = 'assets/music/song_file/';

  switch (songName) {
    case '비행기':
      return '$path_level/airplane.mp3';
    case '산들바람':
      return '$path_level/sandeulbalam.mp3';
    case '숨바꼭질':
      return '$path_level/sumbakkogjil.mp3';
    case '가을바람':
      return '$path_level/autumn.mp3';
    case '봄':
      return '$path_level/spring.mp3';
    case '여름':
      return '$path_level/summer.mp3';
    case '코스모스':
      return '$path_level/cosmos.mp3';
    case '줄넘기':
      return '$path_level/arirang.mp3';
    case '남생이 놀아라':
      return '$path_level/arirang.mp3';
    case '꼭꼭 숨어라':
      return '$path_level/arirang.mp3';
    case '배틀가':
      return '$path_level/arirang.mp3';
    case '시냇물':
      return '$path_level/arirang.mp3';
    case '겨울':
      return '$path_level/arirang.mp3';
    case '새콤달콤':
      return '$path_level/arirang.mp3';
    case '아리랑':
      return '$path_level/arirang.mp3'; //O
    case '색시풀':
      return '$path_level/saegsipul.mp3'; //O
    case '밀양 아리랑':
      return '$path_level/arirang.mp3';
    case '도라지타령':
      return '$path_level/arirang.mp3';
    case '강아지':
      return '$path_level/arirang.mp3';
    case '봄빛':
      return '$path_level/arirang.mp3';
    case '범벅타령':
      return '$path_level/arirang.mp3';
    case '둥개둥개 둥개야':
      return '$path_level/arirang.mp3';
    case '늴늬리야':
      return '$path_level/arirang.mp3';
    case '나물노래':
      return '$path_level/arirang.mp3';
    case '월워리 청청':
      return '$path_level/wolwarycheongcheong.mp3'; //O
    case '새노래':
      return '$path_level/arirang.mp3';
    case '살구대소리':
      return '$path_level/arirang.mp3';
    case '제주도 타령ㄴ':
      return '$path_level/arirang.mp3';

    default:
      return "";
  }
}
