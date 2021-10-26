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
            animatable:
                new ColorTween(begin: Colors.yellow, end: Colors.yellowAccent),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 8),
            tag: "color")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.white.withOpacity(0.1),
                end: Colors.yellowAccent[50]),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 4000),
            tag: "colors")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.yellowAccent, end: Colors.yellowAccent),
            from: const Duration(milliseconds: 4005),
            to: const Duration(seconds: 8),
            tag: "colors")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.white.withOpacity(0.1),
                end: Colors.yellowAccent[50]),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 8500),
            tag: "colorss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.yellowAccent, end: Colors.yellowAccent),
            from: const Duration(milliseconds: 8500),
            to: const Duration(seconds: 14),
            tag: "colorss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.white.withOpacity(0.1),
                end: Colors.yellowAccent[50]),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 13500),
            tag: "colorsss")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.yellowAccent, end: Colors.yellowAccent),
            from: const Duration(milliseconds: 13500),
            to: const Duration(seconds: 19),
            tag: "colorsss")
        .addAnimatable(
            animatable: new Tween<double>(begin: 82.2, end: 82.2),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 8000),
            tag: "width",
            curve: Curves.easeIn)
        .addAnimatable(
            animatable: new Tween<double>(begin: 100.0, end: 100.0),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 8000),
            tag: "height",
            curve: Curves.ease)
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 100.0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 1000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 100.0),
              end: const EdgeInsets.only(top: 200.0),
            ),
            from: const Duration(milliseconds: 1000),
            to: const Duration(milliseconds: 2000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 200.0),
              end: const EdgeInsets.only(top: 300.0),
            ),
            from: const Duration(milliseconds: 2000),
            to: const Duration(milliseconds: 3000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 300.0),
              end: const EdgeInsets.only(top: 400.0),
            ),
            from: const Duration(milliseconds: 3000),
            to: const Duration(milliseconds: 4000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 400.0),
              end: const EdgeInsets.only(top: 500.0),
            ),
            from: const Duration(milliseconds: 4000),
            to: const Duration(milliseconds: 5000),
            curve: Curves.ease,
            tag: "padding")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0),
              end: const EdgeInsets.only(top: 0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 100.0),
            ),
            from: const Duration(milliseconds: 5000),
            to: const Duration(milliseconds: 6000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 100.0),
              end: const EdgeInsets.only(top: 200.0),
            ),
            from: const Duration(milliseconds: 6000),
            to: const Duration(milliseconds: 7000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 200.0),
              end: const EdgeInsets.only(top: 300.0),
            ),
            from: const Duration(milliseconds: 7000),
            to: const Duration(milliseconds: 8000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 300.0),
              end: const EdgeInsets.only(top: 400.0),
            ),
            from: const Duration(milliseconds: 8000),
            to: const Duration(milliseconds: 9000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 400.0),
              end: const EdgeInsets.only(top: 500.0),
            ),
            from: const Duration(milliseconds: 9000),
            to: const Duration(milliseconds: 10000),
            curve: Curves.ease,
            tag: "paddings")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0),
              end: const EdgeInsets.only(top: 0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 100.0),
            ),
            from: const Duration(milliseconds: 9000),
            to: const Duration(milliseconds: 10000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 100.0),
              end: const EdgeInsets.only(top: 200.0),
            ),
            from: const Duration(milliseconds: 10000),
            to: const Duration(milliseconds: 11000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 200.0),
              end: const EdgeInsets.only(top: 300.0),
            ),
            from: const Duration(milliseconds: 11000),
            to: const Duration(milliseconds: 12000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 300.0),
              end: const EdgeInsets.only(top: 400.0),
            ),
            from: const Duration(milliseconds: 12000),
            to: const Duration(milliseconds: 13000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 400.0),
              end: const EdgeInsets.only(top: 500.0),
            ),
            from: const Duration(milliseconds: 13000),
            to: const Duration(milliseconds: 14000),
            curve: Curves.ease,
            tag: "paddingss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0),
              end: const EdgeInsets.only(top: 0),
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 0),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 0.0),
              end: const EdgeInsets.only(top: 100.0),
            ),
            from: const Duration(milliseconds: 14000),
            to: const Duration(milliseconds: 15000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 100.0),
              end: const EdgeInsets.only(top: 200.0),
            ),
            from: const Duration(milliseconds: 15000),
            to: const Duration(milliseconds: 16000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 200.0),
              end: const EdgeInsets.only(top: 300.0),
            ),
            from: const Duration(milliseconds: 16000),
            to: const Duration(milliseconds: 17000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 300.0),
              end: const EdgeInsets.only(top: 400.0),
            ),
            from: const Duration(milliseconds: 17000),
            to: const Duration(milliseconds: 18000),
            curve: Curves.ease,
            tag: "paddingsss")
        .addAnimatable(
            animatable: new EdgeInsetsTween(
              begin: const EdgeInsets.only(top: 400.0),
              end: const EdgeInsets.only(top: 500.0),
            ),
            from: const Duration(milliseconds: 18000),
            to: const Duration(milliseconds: 19000),
            curve: Curves.ease,
            tag: "paddingsss")
        .animate(controller);
    _playAnimation();
  }

  Future<Null> _playAnimation() async {
    try {
      await controller.forward().orCancel;
      // await controller.repeat(period: Duration(seconds: 8)).orCancel;
      await controller.reverse().orCancel;
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sequence"),
      ),
      body: new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: new AnimatedBuilder(
          builder: (context, child) {
            return new Center(
                child: Container(
              width: 330,
              height: 500,
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
      ),
    );
  }
}
