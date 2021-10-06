import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeMenu1 extends StatelessWidget {
  final tabLength;
  const HomeMenu1({Key? key, this.tabLength}) : super(key: key);

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
      length: 2,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 알아보기',
          tabbar: defaultTabBar(
            tabList: [
              Tab(text: '역사'),
              Tab(text: '종류'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CarouselListWidget(
              carouselList: [PictureAndText(), testContainer()],
            ),
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
