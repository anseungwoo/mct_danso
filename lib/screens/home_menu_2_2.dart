import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class HomeMenu22 extends StatelessWidget {
  HomeMenu22({Key? key}) : super(key: key);

  // final SoundController soundController = Get.put(SoundController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          tabbarAndAppBar(title: '단계별 연습', tabbar: null, enableTabBar: false),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              height: 22.h,
              child: Center(
                child: Text('왼손 / 오른손'),
              ),
            ),
            SizedBox(height: 31.h),
            GetBuilder<DansoSoundLearningController>(
                init: DansoSoundLearningController(),
                builder: (controller) {
                  return Container(
                    // color: Colors.lightGreenAccent,
                    height: 420.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Container(
                              width: 47.w,
                              height: 420.h,
                              color: Colors.brown,
                              child: Center(child: Text('단소 이미지로 변경')),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.lightGreen,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('단소를 불어보세요'),
                                SizedBox(height: 30.h),
                                Container(
                                  color: Colors.white,
                                  height: 97.w,
                                  width: 97.w,
                                ),
                                SizedBox(height: 21.h),
                                Text('중'),
                                SizedBox(height: 18.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    UpDownButton(
                                      icons: Icons.arrow_upward,
                                      onPressed: () {
                                        print('hello');
                                      },
                                    ),
                                    SizedBox(width: 12.w),
                                    UpDownButton(
                                      icons: Icons.arrow_downward,
                                      onPressed: null,
                                    ),
                                  ],
                                ),
                                SoundButton(
                                  title: '${controller.buttonTitle}',
                                  onPressed: () {
                                    controller.changeSoundTuningState();
                                  },
                                ),
                                SoundButton(
                                  title: '소리찾기',
                                  onPressed: controller.soundTuningState
                                      ? null
                                      : () {},
                                ),
                                SoundButton(
                                  title: '연습하기',
                                  onPressed: controller.soundTuningState
                                      ? null
                                      : () {},
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class SoundButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const SoundButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(130.w, 45.h),
        ),
      ),
    );
  }
}

class UpDownButton extends StatelessWidget {
  final IconData icons;
  final Function()? onPressed;
  const UpDownButton({
    Key? key,
    required this.icons,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icons),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(59.w, 35.h),
      ),
    );
  }
}
