// import 'package:flutter/material.dart';
// import 'dart:typed_data';
// import 'package:flutter_audio_capture/flutter_audio_capture.dart';
// import 'package:pitch_detector_dart/pitch_detector.dart';
// import 'package:pitchupdart/instrument_type.dart';
// import 'package:pitchupdart/pitch_handler.dart';

// class Pitch extends StatefulWidget {
//   Pitch({Key? key, required this.title}) : super(key: key);

//   String title;

//   @override
//   State<Pitch> createState() => _PitchState();
// }

// class _PitchState extends State<Pitch> {
//   final _audioRecorder = FlutterAudioCapture();
//   final pitchDetectorDart = PitchDetector(44100, 2000);
//   final pitchupDart = PitchHandler(InstrumentType.guitar);

//   var note = '';
//   var status = 'Click on start';
//   var pitch;
//   @override
//   void dispose() {
//     _stopCapture();

//     super.dispose();
//   }

//   Future<void> _startCapture() async {
//     await _audioRecorder.start(listener, onError,
//         sampleRate: 44100, bufferSize: 3000);

//     setState(() {
//       note = '';
//       status = 'Play something';
//     });
//   }

//   Future<void> _stopCapture() async {
//     await _audioRecorder.stop();

//     setState(() {
//       note = '';
//       status = 'Click on start';
//     });
//   }

//   void listener(dynamic obj) {
//     //Gets the audio sample
//     var buffer = Float64List.fromList(obj.cast<double>());
//     final audioSample = buffer.toList();
//     //Uses pitch_detector_dart library to detect a pitch from the audio sample
//     final result = pitchDetectorDart.getPitch(audioSample);
//     //If there is a pitch - evaluate it
//     if (result.pitched) {
//       //Uses the pitchupDart library to check a given pitch for a Guitar
//       final handledPitchResult = pitchupDart.handlePitch(result.pitch);
//       //Updates the state with the result
//       setState(() {
//         note = handledPitchResult.note;
//         pitch = handledPitchResult.expectedFrequency;
//         status = handledPitchResult.tuningStatus.toString();
//       });
//     }
//   }

//   void onError(Object e) {
//     print(e);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                   child: Text(
//                 note,
//                 style: const TextStyle(
//                     color: Colors.black87,
//                     fontSize: 25.0,
//                     fontWeight: FontWeight.bold),
//               )),
//               Center(
//                   child: Text(
//                 '$pitch',
//                 style: const TextStyle(
//                     color: Colors.black87,
//                     fontSize: 25.0,
//                     fontWeight: FontWeight.bold),
//               )),
//               Center(
//                   child: Text(
//                 status,
//                 style: const TextStyle(
//                     color: Colors.black87,
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.bold),
//               )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                       onPressed: _startCapture, child: Text('Start')),
//                   ElevatedButton(onPressed: _stopCapture, child: Text('Stop')),
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
// }
