import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import 'package:project_danso/common/const.dart';

class AnimationPage extends StatefulWidget {
  int tempo;
  double jonlenght;
  AnimationPage({@required this.jonlenght, @required this.tempo});

  @override
  _AnimationPageState createState() => new _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this);
    find();
  }

  void find() {
    var pading = widget.jonlenght == 6 ? jonSixHeight : jonEightHeight;
    sequenceAnimation = new SequenceAnimationBuilder()
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: Duration(milliseconds: 0),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 6
                    : widget.tempo * 8),
            tag: "color")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0),
                end: Colors.blue.withOpacity(0)),
            from: Duration(milliseconds: 0),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 5
                    : widget.tempo * 7),
            tag: "colors")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 5
                    : widget.tempo * 7),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 12
                    : widget.tempo * 16),
            tag: "colors")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0),
                end: Colors.blue.withOpacity(0)),
            from: Duration(milliseconds: 0),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 11
                    : widget.tempo * 15),
            tag: "colorss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 11
                    : widget.tempo * 15),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 18
                    : widget.tempo * 24),
            tag: "colorss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0),
                end: Colors.blue.withOpacity(0)),
            from: Duration(milliseconds: 0),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 17
                    : widget.tempo * 23),
            tag: "colorsss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 17
                    : widget.tempo * 23),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 24
                    : widget.tempo * 32),
            tag: "colorsss")
        //첫번쨰줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: 0.0.h),
              end: EdgeInsets.only(top: pading.h),
            ),
            from: Duration(milliseconds: 0),
            to: Duration(
                milliseconds:
                    widget.jonlenght == 6 ? widget.tempo : widget.tempo),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading.h),
              end: EdgeInsets.only(top: pading * 2.h),
            ),
            from: Duration(
                milliseconds:
                    widget.jonlenght == 6 ? widget.tempo : widget.tempo),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 2
                    : widget.tempo * 2),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 2.h),
              end: EdgeInsets.only(top: pading * 3.h),
            ),
            from: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 2
                    : widget.tempo * 2),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 3
                    : widget.tempo * 3),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 3.h),
              end: EdgeInsets.only(top: pading * 4.h),
            ),
            from: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 3
                    : widget.tempo * 3),
            to: Duration(
                milliseconds: widget.jonlenght == 6
                    ? widget.tempo * 4
                    : widget.tempo * 4),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 4.h),
              end: EdgeInsets.only(top: pading * 5.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 4 : widget.tempo * 4),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 5 : widget.tempo * 5),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 5.h),
              end: EdgeInsets.only(top: pading * 6.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 5 : widget.tempo * 5),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 6 : widget.tempo * 6),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 6.h),
              end: EdgeInsets.only(top: pading * 7.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 6 : widget.tempo * 6),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 7 : widget.tempo * 7),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 7.h),
              end: EdgeInsets.only(top: pading * 8.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 7 : widget.tempo * 7),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 8 : widget.tempo * 8),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 8.h),
              end: EdgeInsets.only(top: pading * 9.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 8 : widget.tempo * 8),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 9 : widget.tempo * 9),
            curve: Curves.ease,
            tag: "padding")
        // 두번째줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: 0.0),
              end: EdgeInsets.only(top: 0.0),
            ),
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: 0.0),
              end: EdgeInsets.only(top: pading.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 6 : widget.tempo * 8),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 7 : widget.tempo * 9),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading.h),
              end: EdgeInsets.only(top: pading * 2.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 7 : widget.tempo * 9),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 8 : widget.tempo * 10),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 2.h),
              end: EdgeInsets.only(top: pading * 3.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 8 : widget.tempo * 10),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 9 : widget.tempo * 11),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 3.h),
              end: EdgeInsets.only(top: pading * 4.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 9 : widget.tempo * 11),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 10 : widget.tempo * 12),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 4.h),
              end: EdgeInsets.only(top: pading * 5.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 10 : widget.tempo * 12),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 11 : widget.tempo * 13),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 5.h),
              end: EdgeInsets.only(top: pading * 6.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 11 : widget.tempo * 13),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 12 : widget.tempo * 14),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 6.h),
              end: EdgeInsets.only(top: pading * 7.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 12 : widget.tempo * 14),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 13 : widget.tempo * 15),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 7.h),
              end: EdgeInsets.only(top: pading * 8.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 13 : widget.tempo * 15),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 14 : widget.tempo * 16),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 8.h),
              end: EdgeInsets.only(top: pading * 9.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 14 : widget.tempo * 16),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 15 : widget.tempo * 17),
            curve: Curves.ease,
            tag: "paddings")
        //세번쨰줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: 0.0),
              end: EdgeInsets.only(top: 0.0),
            ),
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: 0.0),
              end: EdgeInsets.only(top: pading.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 12 : widget.tempo * 16),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 13 : widget.tempo * 17),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading.h),
              end: EdgeInsets.only(top: pading * 2.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 13 : widget.tempo * 17),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 14 : widget.tempo * 18),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 2.h),
              end: EdgeInsets.only(top: pading * 3.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 14 : widget.tempo * 18),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 15 : widget.tempo * 19),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 3.h),
              end: EdgeInsets.only(top: pading * 4.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 15 : widget.tempo * 19),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 16 : widget.tempo * 20),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 4.h),
              end: EdgeInsets.only(top: pading * 5.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 16 : widget.tempo * 20),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 17 : widget.tempo * 21),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 5.h),
              end: EdgeInsets.only(top: pading * 6.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 17 : widget.tempo * 21),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 18 : widget.tempo * 22),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 6.h),
              end: EdgeInsets.only(top: pading * 7.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 18 : widget.tempo * 22),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 19 : widget.tempo * 23),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 7.h),
              end: EdgeInsets.only(top: pading * 8.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 19 : widget.tempo * 23),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 20 : widget.tempo * 24),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 8.h),
              end: EdgeInsets.only(top: pading * 9.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 20 : widget.tempo * 24),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 21 : widget.tempo * 25),
            curve: Curves.ease,
            tag: "paddingss")
        //네번쨰줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: 0.0),
              end: EdgeInsets.only(top: 0.0),
            ),
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: 0.0),
              end: EdgeInsets.only(top: pading.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 18 : widget.tempo * 24),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 19 : widget.tempo * 25),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading.h),
              end: EdgeInsets.only(top: pading * 2.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 19 : widget.tempo * 25),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 20 : widget.tempo * 26),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 2.h),
              end: EdgeInsets.only(top: pading * 3.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 20 : widget.tempo * 26),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 21 : widget.tempo * 27),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 3.h),
              end: EdgeInsets.only(top: pading * 4.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 21 : widget.tempo * 27),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 22 : widget.tempo * 28),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 4.h),
              end: EdgeInsets.only(top: pading * 5.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 22 : widget.tempo * 28),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 23 : widget.tempo * 29),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 5.h),
              end: EdgeInsets.only(top: pading * 6.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 23 : widget.tempo * 29),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 24 : widget.tempo * 30),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 6.h),
              end: EdgeInsets.only(top: pading * 7.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 24 : widget.tempo * 30),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 24 : widget.tempo * 31),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 7.h),
              end: EdgeInsets.only(top: pading * 8.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 24 : widget.tempo * 31),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 24 : widget.tempo * 32),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: EdgeInsets.only(top: pading * 8.h),
              end: EdgeInsets.only(top: pading * 9.h),
            ),
            from: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 24 : widget.tempo * 32),
            to: Duration(milliseconds: widget.jonlenght == 6 ? widget.tempo * 24 : widget.tempo * 33),
            curve: Curves.ease,
            tag: "paddingsss")
        .animate(controller);
  }

  Future<Null> _playAnimation() async {
    try {
      await controller.forward().orCancel;
      // await controller.repeat(period: Duration(seconds: 8)).orCancel;
      // await controller.reverse().orCancel;
      controller.reset();
      _playAnimation();
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: new AnimatedBuilder(
        builder: (context, child) {
          return new Center(
              child: Container(
            width: 330.w,
            height: 515.h,
            color: Colors.grey.withOpacity(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: sequenceAnimation["paddingsss"].value,
                  child: new Container(
                    height: widget.jonlenght == 6
                        ? jonSixHeight.h
                        : jonEightHeight.h,
                    width: 82.w,
                    decoration: BoxDecoration(
                        color: sequenceAnimation["colorsss"].value,
                        border: Border.symmetric(
                            vertical:
                                BorderSide(width: 4, color: Colors.blue))),
                  ),
                ),
                Container(
                  padding: sequenceAnimation["paddingss"].value,
                  child: new Container(
                    height: widget.jonlenght == 6
                        ? jonSixHeight.h
                        : jonEightHeight.h,
                    width: 82.w,
                    decoration: BoxDecoration(
                        color: sequenceAnimation["colorss"].value,
                        border: Border.symmetric(
                            vertical:
                                BorderSide(width: 4, color: Colors.blue))),
                  ),
                ),
                Container(
                  padding: sequenceAnimation["paddings"].value,
                  child: new Container(
                    height: widget.jonlenght == 6
                        ? jonSixHeight.h
                        : jonEightHeight.h,
                    width: 82.w,
                    decoration: BoxDecoration(
                        color: sequenceAnimation["colors"].value,
                        border: Border.symmetric(
                            vertical:
                                BorderSide(width: 4, color: Colors.blue))),
                  ),
                ),
                Container(
                  padding: sequenceAnimation["padding"].value,
                  child: new Container(
                    height: widget.jonlenght == 6
                        ? jonSixHeight.h
                        : jonEightHeight.h,
                    width: 82.w,
                    decoration: BoxDecoration(
                        color: sequenceAnimation["color"].value,
                        border: Border.symmetric(
                            vertical:
                                BorderSide(width: 4, color: Colors.blue))),
                  ),
                ),
              ],
            ),
          ));
        },
        animation: controller,
      ),
    );
  }
}
