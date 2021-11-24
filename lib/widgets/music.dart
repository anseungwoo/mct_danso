// // This example demonstrates Android audio effects.
// //
// // To run:
// //
// // flutter run -t lib/example_effects.dart

// import 'dart:math';

// import 'package:audio_session/audio_session.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:just_audio/just_audio.dart';

// import 'package:rxdart/rxdart.dart';

// class Music extends StatefulWidget {
//   @override
//   _MusicState createState() => _MusicState();
// }

// class _MusicState extends State<Music> with WidgetsBindingObserver {
//   final _equalizer = AndroidEqualizer();
//   final _loudnessEnhancer = AndroidLoudnessEnhancer();
//   late final AudioPlayer _player = AudioPlayer(
//     audioPipeline: AudioPipeline(
//       androidAudioEffects: [
//         _loudnessEnhancer,
//         _equalizer,
//       ],
//     ),
//   );

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addObserver(this);
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.black,
//     ));
//     _init();
//   }

//   Future<void> _init() async {
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration.speech());
//     try {
//       await _player.setAudioSource(AudioSource.uri(Uri.parse(
//           "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
//     } catch (e) {
//       print("Error loading audio source: $e");
//     }
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance?.removeObserver(this);
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       // Release the player's resources when not in use. We use "stop" so that
//       // if the app resumes later, it will still remember what position to
//       // resume from.
//       _player.stop();
//     }
//   }
//   Stream<PositionData> get _positionDataStream =>
//       Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
//           _player.positionStream,
//           _player.bufferedPositionStream,
//           _player.durationStream,
//           (position, bufferedPosition, duration) => PositionData(
//               position, bufferedPosition, duration ?? Duration.zero));

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               StreamBuilder<bool>(
//                 stream: _loudnessEnhancer.enabledStream,
//                 builder: (context, snapshot) {
//                   final enabled = snapshot.data ?? false;
//                   return SwitchListTile(
//                     title: Text('Loudness Enhancer'),
//                     value: enabled,
//                     onChanged: _loudnessEnhancer.setEnabled,
//                   );
//                 },
//               ),
//               LoudnessEnhancerControls(loudnessEnhancer: _loudnessEnhancer),
//               StreamBuilder<bool>(
//                 stream: _equalizer.enabledStream,
//                 builder: (context, snapshot) {
//                   final enabled = snapshot.data ?? false;
//                   return SwitchListTile(
//                     title: Text('Equalizer'),
//                     value: enabled,
//                     onChanged: _equalizer.setEnabled,
//                   );
//                 },
//               ),
//               Expanded(
//                 child: EqualizerControls(equalizer: _equalizer),
//               ),
//               ControlButtons(_player),
//               StreamBuilder<PositionData>(
//                 stream: _positionDataStream,
//                 builder: (context, snapshot) {
//                   final positionData = snapshot.data;
//                   return SeekBar(
//                     duration: positionData?.duration ?? Duration.zero,
//                     position: positionData?.position ?? Duration.zero,
//                     bufferedPosition:
//                         positionData?.bufferedPosition ?? Duration.zero,
//                     onChangeEnd: _player.seek,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoudnessEnhancerControls extends StatelessWidget {
//   final AndroidLoudnessEnhancer loudnessEnhancer;

//   const LoudnessEnhancerControls({
//     Key? key,
//     required this.loudnessEnhancer,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<double>(
//       stream: loudnessEnhancer.targetGainStream,
//       builder: (context, snapshot) {
//         final targetGain = snapshot.data ?? 0.0;
//         return Slider(
//           min: -1.0,
//           max: 1.0,
//           value: targetGain,
//           onChanged: loudnessEnhancer.setTargetGain,
//           label: 'foo',
//         );
//       },
//     );
//   }
// }

// class EqualizerControls extends StatelessWidget {
//   final AndroidEqualizer equalizer;

//   const EqualizerControls({
//     Key? key,
//     required this.equalizer,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<AndroidEqualizerParameters>(
//       future: equalizer.parameters,
//       builder: (context, snapshot) {
//         final parameters = snapshot.data;
//         if (parameters == null) return SizedBox();
//         return Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             for (var band in parameters.bands)
//               Expanded(
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: StreamBuilder<double>(
//                         stream: band.gainStream,
//                         builder: (context, snapshot) {
//                           return VerticalSlider(
//                             min: parameters.minDecibels,
//                             max: parameters.maxDecibels,
//                             value: band.gain,
//                             onChanged: band.setGain,
//                           );
//                         },
//                       ),
//                     ),
//                     Text('${band.centerFrequency.round()} Hz'),
//                   ],
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }

// class VerticalSlider extends StatelessWidget {
//   final double value;
//   final double min;
//   final double max;
//   final ValueChanged<double>? onChanged;

//   const VerticalSlider({
//     Key? key,
//     required this.value,
//     this.min = 0.0,
//     this.max = 1.0,
//     this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       fit: BoxFit.fitHeight,
//       alignment: Alignment.bottomCenter,
//       child: Transform.rotate(
//         angle: -pi / 2,
//         child: Container(
//           width: 400.0,
//           height: 400.0,
//           alignment: Alignment.center,
//           child: Slider(
//             value: value,
//             min: min,
//             max: max,
//             onChanged: onChanged,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ControlButtons extends StatelessWidget {
//   final AudioPlayer player;

//   ControlButtons(this.player);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: Icon(Icons.volume_up),
//           onPressed: () {
//             showSliderDialog(
//               context: context,
//               title: "Adjust volume",
//               divisions: 10,
//               min: 0.0,
//               max: 1.0,
//               value: player.volume,
//               stream: player.volumeStream,
//               onChanged: player.setVolume,
//             );
//           },
//         ),
//         StreamBuilder<PlayerState>(
//           stream: player.playerStateStream,
//           builder: (context, snapshot) {
//             final playerState = snapshot.data;
//             final processingState = playerState?.processingState;
//             final playing = playerState?.playing;
//             if (processingState == ProcessingState.loading ||
//                 processingState == ProcessingState.buffering) {
//               return Container(
//                 margin: EdgeInsets.all(8.0),
//                 width: 64.0,
//                 height: 64.0,
//                 child: CircularProgressIndicator(),
//               );
//             } else if (playing != true) {
//               return IconButton(
//                 icon: Icon(Icons.play_arrow),
//                 iconSize: 64.0,
//                 onPressed: player.play,
//               );
//             } else if (processingState != ProcessingState.completed) {
//               return IconButton(
//                 icon: Icon(Icons.pause),
//                 iconSize: 64.0,
//                 onPressed: player.pause,
//               );
//             } else {
//               return IconButton(
//                 icon: Icon(Icons.replay),
//                 iconSize: 64.0,
//                 onPressed: () => player.seek(Duration.zero),
//               );
//             }
//           },
//         ),
//         StreamBuilder<double>(
//           stream: player.speedStream,
//           builder: (context, snapshot) => IconButton(
//             icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             onPressed: () {
//               showSliderDialog(
//                 context: context,
//                 title: "Adjust speed",
//                 divisions: 10,
//                 min: 0.5,
//                 max: 1.5,
//                 value: player.speed,
//                 stream: player.speedStream,
//                 onChanged: player.setSpeed,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SeekBar extends StatefulWidget {
//   final Duration duration;
//   final Duration position;
//   final Duration bufferedPosition;
//   final ValueChanged<Duration>? onChanged;
//   final ValueChanged<Duration>? onChangeEnd;

//   SeekBar({
//     required this.duration,
//     required this.position,
//     required this.bufferedPosition,
//     this.onChanged,
//     this.onChangeEnd,
//   });

//   @override
//   _SeekBarState createState() => _SeekBarState();
// }

// class _SeekBarState extends State<SeekBar> {
//   double? _dragValue;
//   late SliderThemeData _sliderThemeData;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     _sliderThemeData = SliderTheme.of(context).copyWith(
//       trackHeight: 2.0,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SliderTheme(
//           data: _sliderThemeData.copyWith(
//             thumbShape: HiddenThumbComponentShape(),
//             activeTrackColor: Colors.blue.shade100,
//             inactiveTrackColor: Colors.grey.shade300,
//           ),
//           child: ExcludeSemantics(
//             child: Slider(
//               min: 0.0,
//               max: widget.duration.inMilliseconds.toDouble(),
//               value: min(widget.bufferedPosition.inMilliseconds.toDouble(),
//                   widget.duration.inMilliseconds.toDouble()),
//               onChanged: (value) {
//                 setState(() {
//                   _dragValue = value;
//                 });
//                 if (widget.onChanged != null) {
//                   widget.onChanged!(Duration(milliseconds: value.round()));
//                 }
//               },
//               onChangeEnd: (value) {
//                 if (widget.onChangeEnd != null) {
//                   widget.onChangeEnd!(Duration(milliseconds: value.round()));
//                 }
//                 _dragValue = null;
//               },
//             ),
//           ),
//         ),
//         SliderTheme(
//           data: _sliderThemeData.copyWith(
//             inactiveTrackColor: Colors.transparent,
//           ),
//           child: Slider(
//             min: 0.0,
//             max: widget.duration.inMilliseconds.toDouble(),
//             value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
//                 widget.duration.inMilliseconds.toDouble()),
//             onChanged: (value) {
//               setState(() {
//                 _dragValue = value;
//               });
//               if (widget.onChanged != null) {
//                 widget.onChanged!(Duration(milliseconds: value.round()));
//               }
//             },
//             onChangeEnd: (value) {
//               if (widget.onChangeEnd != null) {
//                 widget.onChangeEnd!(Duration(milliseconds: value.round()));
//               }
//               _dragValue = null;
//             },
//           ),
//         ),
//         Positioned(
//           right: 16.0,
//           bottom: 0.0,
//           child: Text(
//               RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
//                       .firstMatch("$_remaining")
//                       ?.group(1) ??
//                   '$_remaining',
//               style: Theme.of(context).textTheme.caption),
//         ),
//       ],
//     );
//   }

//   Duration get _remaining => widget.duration - widget.position;
// }

// class HiddenThumbComponentShape extends SliderComponentShape {
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     required bool isDiscrete,
//     required TextPainter labelPainter,
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required TextDirection textDirection,
//     required double value,
//     required double textScaleFactor,
//     required Size sizeWithOverflow,
//   }) {}
// }

// class PositionData {
//   final Duration position;
//   final Duration bufferedPosition;
//   final Duration duration;

//   PositionData(this.position, this.bufferedPosition, this.duration);
// }

// void showSliderDialog({
//   required BuildContext context,
//   required String title,
//   required int divisions,
//   required double min,
//   required double max,
//   String valueSuffix = '',
//   // TODO: Replace these two by ValueStream.
//   required double value,
//   required Stream<double> stream,
//   required ValueChanged<double> onChanged,
// }) {
//   showDialog<void>(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text(title, textAlign: TextAlign.center),
//       content: StreamBuilder<double>(
//         stream: stream,
//         builder: (context, snapshot) => Container(
//           height: 100.0,
//           child: Column(
//             children: [
//               Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
//                   style: TextStyle(
//                       fontFamily: 'Fixed',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24.0)),
//               Slider(
//                 divisions: divisions,
//                 min: min,
//                 max: max,
//                 value: snapshot.data ?? value,
//                 onChanged: onChanged,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
