import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/base_widgets/tabbar_and_appbar.dart';

class AdjustMyDanso extends StatelessWidget {
  const AdjustMyDanso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(
          title: "내 단소 소리 조정 하기", tabbar: null, enableTabBar: false),
      body: Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "왜 조정을 해야될까??????",
                style: TextStyle(fontSize: 30, fontWeight: bold),
              ),
              SizedBox(height: 5.h),
              questionsText("소식적에 말이야 내가 단소를 불면 틀린적이 없어."),
              SizedBox(height: 5.h),
              questionsText("나도 처음에는 단소 소리를 틀렸었지"),
              SizedBox(height: 5.h),
              questionsText("그래서 왜인지 궁금했어. 단소의 종류가 많더라고"),
              SizedBox(height: 5.h),
              questionsText("어떻개 해야될까~ 고민하다가"),
              SizedBox(height: 5.h),
              questionsText("앱에서 내가 가진 단소소리를 조정할수 있더라고."),
              SizedBox(height: 5.h),
              questionsText('조정하기를 딱 누르고 "태"를 부르니깐'),
              SizedBox(height: 5.h),
              questionsText("딱 마술처럼 틀린적이 없어"),
              SizedBox(height: 5.h),
              questionsText("그러니깐 꼭 단소소리를 조정해야 한다는 말이야!"),
              SizedBox(height: 20.h),
              Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("내 단소 소리 조정 하기"))),
              Center(child: questionsText("내가 불고있는 피치 음량")),
              SizedBox(height: 10.h),
              Text("평균적인 수치 620~670"),
              Text("평균적인 수치 보다 차이보다 -10~10 정도 차이가 있을수 있습니다."),
              Text("너무 높거나 너무 낮으면 측정이 안될수 있습니다. "),
            ],
          ),
        ),
      ),
    );
  }

  Text questionsText(String text) => Text(
        text,
        style: TextStyle(fontSize: textSixSize, fontWeight: bold),
      );
}
