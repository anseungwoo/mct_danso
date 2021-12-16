import 'package:audio_session/audio_session.dart';

class AudioPlayerUtil {
  late AudioSession audioSessions;

  static final AudioPlayerUtil _instance = AudioPlayerUtil._internal();

  factory AudioPlayerUtil() => _instance;

  AudioPlayerUtil._internal() {
    _audioSessionConfigure();
  }

  void _audioSessionConfigure() =>
      AudioSession.instance.then((audioSession) async => await audioSession
          .configure(const AudioSessionConfiguration(
            avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
            avAudioSessionCategoryOptions:
                AVAudioSessionCategoryOptions.defaultToSpeaker,
            avAudioSessionMode: AVAudioSessionMode.videoRecording,
            avAudioSessionRouteSharingPolicy:
                AVAudioSessionRouteSharingPolicy.defaultPolicy,
            avAudioSessionSetActiveOptions:
                AVAudioSessionSetActiveOptions.notifyOthersOnDeactivation,
            // androidAudioAttributes: AndroidAudioAttributes(
            //   contentType: AndroidAudioContentType.music,
            //   flags: AndroidAudioFlags.none,
            //   usage: AndroidAudioUsage.media,
            // ),
            // androidAudioFocusGainType: AndroidAudioFocusGainType.gainTransient,
            // androidWillPauseWhenDucked: true,
          ))
          .then((_) => audioSessions = audioSession));

  void stopSession() async {
    await audioSessions.setActive(false);
  }

  void startSession() async {
    await audioSessions.setActive(true);
  }
}
