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
      return '';
  }
}

String getSongFilePath(String songName) {
  var path_level = 'assets/music/song_file';

  switch (songName) {
    //1단계
    case '1':
      return '$path_level/level_1.mp3';
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
    //2단계
    case '2':
      return '$path_level/level_2.mp3';
    case '줄넘기':
      return '$path_level/julneomgi.mp3';
    case '남생이 놀아라':
      return '$path_level/namsaenga.mp3';
    case '꼭꼭 숨어라':
      return '$path_level/kkogkkog.mp3';
    case '베틀가':
      return '$path_level/baeteulga.mp3';
    case '시냇물':
      return '$path_level/sinaesmul.mp3';
    case '거울':
      return '$path_level/mirror.mp3';
    case '새콤달콤':
      return '$path_level/saekomdalkom.mp3';
    //3단계
    case '3':
      return '$path_level/level_3.mp3';
    case '아리랑':
      return '$path_level/arirang.mp3'; //O
    case '색시풀':
      return '$path_level/saegsipul.mp3'; //O
    case '밀양 아리랑':
      return '$path_level/mil_yang_alilang.mp3';
    case '도라지타령':
      return '$path_level/dolaji.mp3';
    case '강아지':
      return '$path_level/puppy.mp3';
    case '봄빛':
      return '$path_level/spring_light.mp3';
    case '범벅타령':
      return '$path_level/beombeog.mp3';
    //4단계
    case '4':
      return '$path_level/level_4.mp3';
    case '둥개둥개 둥개야':
      return '$path_level/dung_gae.mp3';
    case '늴늬리야':
      return '$path_level/nuilnuiliya.mp3';
    case '나물노래':
      return '$path_level/namul.mp3';
    case '월워리 청청':
      return '$path_level/wolwarycheongcheong.mp3'; //O
    case '새노래':
      return '$path_level/saenolae.mp3';
    case '실구대소리':
      return '$path_level/silgudae.mp3';
    case '제주도 타령':
      return '$path_level/jejudo.mp3';
    case '5':
      return '$path_level/level_5.mp3';
    default:
      return '';
  }
}
