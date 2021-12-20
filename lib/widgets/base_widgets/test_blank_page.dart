import 'package:flutter/material.dart';

class TestBlankPage extends StatelessWidget {
  const TestBlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('테스트용 빈 페이지입니다.'),
      ),
    );
  }
}
