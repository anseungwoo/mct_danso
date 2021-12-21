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

const String ARIRANG = 'assets/music/level_3/arirang.mp3';
const String SAEGSIPUL = 'assets/music/level_3/saegsipul.mp3';
