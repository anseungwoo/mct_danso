// import 'package:get/get.dart';
// import 'package:project_danso/utils/danso_function.dart';

// class SheetController extends GetxController {
//   var koSheet = [];
//   var chiSheet = [];

//   void jungGanBoSheet(
//       {required String songTitle,
//       required String jangdan,
//       required String songSheet}) async {
//     var createJungGanBo = JungGanBo(songTitle, jangdan, songSheet);

//     createJungGanBo.sheet[0].yulmyeongs[0];
//     for (var i = 0; i < createJungGanBo.sheet.length; i++) {
//       for (var j = 0; j < createJungGanBo.sheet[i].yulmyeongs.length; j++) {
//         // To do what you can do with YulmyeonNote
//         // print(testJungGanBo.sheet[i].yulmyeongs[j].toHangeul());
//         // print(testJungGanBo.sheet[i].yulmyeongs[j].toChineseCharacter());
//         koSheet.add(createJungGanBo.sheet[i].yulmyeongs[j].toHangeul());
//         chiSheet
//             .add(createJungGanBo.sheet[i].yulmyeongs[j].toChineseCharacter());
//         // koSheet.assign(testJungGanBo.sheet[i].yulmyeongs[j].toHangeul());
//       }
//     }
//     print(koSheet);
//     update();
//   }

//   void deleteList() {
//     koSheet.clear();
//     chiSheet.clear();
//   }
// }
