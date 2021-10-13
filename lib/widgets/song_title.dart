import 'package:flutter/material.dart';
import 'package:project_danso/widgets/tabbar_and_appbar.dart';

class SongTitle extends StatelessWidget {
  const SongTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: "노래곡 제목", tabbar: null, enableTabBar: false),
      body: Text("data"),
    );
  }
}
