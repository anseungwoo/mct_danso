import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimationPage extends StatefulWidget {
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

    sequenceAnimation = new SequenceAnimationBuilder()
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 8),
            tag: "color")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0),
                end: Colors.blue.withOpacity(0)),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 7500),
            tag: "colors")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: const Duration(milliseconds: 7500),
            to: const Duration(seconds: 16),
            tag: "colors")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0),
                end: Colors.blue.withOpacity(0)),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 15500),
            tag: "colorss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: const Duration(milliseconds: 15500),
            to: const Duration(seconds: 24),
            tag: "colorss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0),
                end: Colors.blue.withOpacity(0)),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 23500),
            tag: "colorsss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.blue.withOpacity(0.2),
                end: Colors.blue.withOpacity(0.2)),
            from: const Duration(milliseconds: 23500),
            to: const Duration(seconds: 33),
            tag: "colorsss")
        .addAnimatable(
            animatable: new Tween<double>(begin: 82.2, end: 82.2),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 8000),
            tag: "width",
            curve: Curves.easeIn)
        .addAnimatable(
            animatable: new Tween<double>(begin: 69.0, end: 69.0),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 8000),
            tag: "height",
            curve: Curves.ease)
        //첫번쨰줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 69.0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 1000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 69.0),
              end: const EdgeInsets.only(top: 138.0),
            ),
            from: const Duration(milliseconds: 1000),
            to: const Duration(milliseconds: 2000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 138.0),
              end: const EdgeInsets.only(top: 205.0),
            ),
            from: const Duration(milliseconds: 2000),
            to: const Duration(milliseconds: 3000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 205.0),
              end: const EdgeInsets.only(top: 272.0),
            ),
            from: const Duration(milliseconds: 3000),
            to: const Duration(milliseconds: 4000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 272.0),
              end: const EdgeInsets.only(top: 339.0),
            ),
            from: const Duration(milliseconds: 4000),
            to: const Duration(milliseconds: 5000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 339.0),
              end: const EdgeInsets.only(top: 406.0),
            ),
            from: const Duration(milliseconds: 5000),
            to: const Duration(milliseconds: 6000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 406.0),
              end: const EdgeInsets.only(top: 473.0),
            ),
            from: const Duration(milliseconds: 6000),
            to: const Duration(milliseconds: 7000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 473.0),
              end: const EdgeInsets.only(top: 540.0),
            ),
            from: const Duration(milliseconds: 7000),
            to: const Duration(milliseconds: 8000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 540.0),
              end: const EdgeInsets.only(top: 607.0),
            ),
            from: const Duration(milliseconds: 8000),
            to: const Duration(milliseconds: 9000),
            curve: Curves.ease,
            tag: "padding")
        // 두번째줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 0.0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 69.0),
            ),
            from: const Duration(milliseconds: 8000),
            to: const Duration(milliseconds: 9000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 69.0),
              end: const EdgeInsets.only(top: 138.0),
            ),
            from: const Duration(milliseconds: 9000),
            to: const Duration(milliseconds: 10000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 138.0),
              end: const EdgeInsets.only(top: 205.0),
            ),
            from: const Duration(milliseconds: 10000),
            to: const Duration(milliseconds: 11000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 205.0),
              end: const EdgeInsets.only(top: 272.0),
            ),
            from: const Duration(milliseconds: 11000),
            to: const Duration(milliseconds: 12000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 272.0),
              end: const EdgeInsets.only(top: 339.0),
            ),
            from: const Duration(milliseconds: 12000),
            to: const Duration(milliseconds: 13000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 339.0),
              end: const EdgeInsets.only(top: 406.0),
            ),
            from: const Duration(milliseconds: 13000),
            to: const Duration(milliseconds: 14000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 406.0),
              end: const EdgeInsets.only(top: 473.0),
            ),
            from: const Duration(milliseconds: 14000),
            to: const Duration(milliseconds: 15000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 473.0),
              end: const EdgeInsets.only(top: 540.0),
            ),
            from: const Duration(milliseconds: 15000),
            to: const Duration(milliseconds: 16000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 540.0),
              end: const EdgeInsets.only(top: 607.0),
            ),
            from: const Duration(milliseconds: 16000),
            to: const Duration(milliseconds: 16500),
            curve: Curves.ease,
            tag: "paddings")
        //세번쨰줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 0.0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 69.0),
            ),
            from: const Duration(milliseconds: 16000),
            to: const Duration(milliseconds: 17000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 69.0),
              end: const EdgeInsets.only(top: 138.0),
            ),
            from: const Duration(milliseconds: 17000),
            to: const Duration(milliseconds: 18000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 138.0),
              end: const EdgeInsets.only(top: 205.0),
            ),
            from: const Duration(milliseconds: 18000),
            to: const Duration(milliseconds: 19000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 205.0),
              end: const EdgeInsets.only(top: 272.0),
            ),
            from: const Duration(milliseconds: 19000),
            to: const Duration(milliseconds: 20000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 272.0),
              end: const EdgeInsets.only(top: 339.0),
            ),
            from: const Duration(milliseconds: 20000),
            to: const Duration(milliseconds: 21000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 339.0),
              end: const EdgeInsets.only(top: 406.0),
            ),
            from: const Duration(milliseconds: 21000),
            to: const Duration(milliseconds: 22000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 406.0),
              end: const EdgeInsets.only(top: 473.0),
            ),
            from: const Duration(milliseconds: 22000),
            to: const Duration(milliseconds: 23000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 473.0),
              end: const EdgeInsets.only(top: 540.0),
            ),
            from: const Duration(milliseconds: 23000),
            to: const Duration(milliseconds: 24000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 540.0),
              end: const EdgeInsets.only(top: 607.0),
            ),
            from: const Duration(milliseconds: 24000),
            to: const Duration(milliseconds: 24500),
            curve: Curves.ease,
            tag: "paddingss")
        //네번쨰줄 0~9 사이
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 0.0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 69.0),
            ),
            from: const Duration(milliseconds: 24000),
            to: const Duration(milliseconds: 25000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 69.0),
              end: const EdgeInsets.only(top: 138.0),
            ),
            from: const Duration(milliseconds: 25000),
            to: const Duration(milliseconds: 26000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 138.0),
              end: const EdgeInsets.only(top: 205.0),
            ),
            from: const Duration(milliseconds: 26000),
            to: const Duration(milliseconds: 27000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 205.0),
              end: const EdgeInsets.only(top: 272.0),
            ),
            from: const Duration(milliseconds: 27000),
            to: const Duration(milliseconds: 28000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 272.0),
              end: const EdgeInsets.only(top: 339.0),
            ),
            from: const Duration(milliseconds: 28000),
            to: const Duration(milliseconds: 29000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 339.0),
              end: const EdgeInsets.only(top: 406.0),
            ),
            from: const Duration(milliseconds: 29000),
            to: const Duration(milliseconds: 30000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 406.0),
              end: const EdgeInsets.only(top: 473.0),
            ),
            from: const Duration(milliseconds: 30000),
            to: const Duration(milliseconds: 31000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 473.0),
              end: const EdgeInsets.only(top: 540.0),
            ),
            from: const Duration(milliseconds: 31000),
            to: const Duration(milliseconds: 32000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 540.0),
              end: const EdgeInsets.only(top: 607.0),
            ),
            from: const Duration(milliseconds: 32000),
            to: const Duration(milliseconds: 33000),
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
            width: 330,
            height: 520,
            color: Colors.grey.withOpacity(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: sequenceAnimation["paddingsss"].value,
                  child: new Container(
                    height: sequenceAnimation["height"].value,
                    width: sequenceAnimation["width"].value,
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
                    height: sequenceAnimation["height"].value,
                    width: sequenceAnimation["width"].value,
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
                    height: sequenceAnimation["height"].value,
                    width: sequenceAnimation["width"].value,
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
                    height: sequenceAnimation["height"].value,
                    width: sequenceAnimation["width"].value,
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
