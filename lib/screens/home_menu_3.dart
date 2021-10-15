import 'package:flutter/material.dart';
import 'package:project_danso/widgets/widgets.dart';

class HomeMenu3 extends StatelessWidget {
  const HomeMenu3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          tabbarAndAppBar(title: '연주곡 익히기', tabbar: null, enableTabBar: false),
      body: DansoLevel(),
    );
  }
}
