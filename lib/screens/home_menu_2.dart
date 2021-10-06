import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/danso_learning.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeMenu2 extends StatelessWidget {
  final tabLength;
  const HomeMenu2({Key? key, this.tabLength}) : super(key: key);

  Widget testContainer() {
    return Container(
      color: Colors.grey,
      height: 100,
      width: 100,
      child: Center(child: Text('asdfasdf')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 알아보기',
          tabbar: defaultTabBar(
            tabList: [
              Tab(text: '연주자세'),
              Tab(text: '율명'),
              Tab(text: '운지법'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CarouselListWidget(
              carouselList: [DansoLearning(), testContainer()],
            ),
            DansoKinds(),
            DansoKinds(),
          ],
        ),
      ),
    );
  }
}

class DansoKinds extends StatelessWidget {
  const DansoKinds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('2')),
    );
  }
}
