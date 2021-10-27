import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';

class MyPageLike extends StatefulWidget {
  final String songname;

  const MyPageLike({Key key, @required this.songname}) : super(key: key);

  @override
  State<MyPageLike> createState() => _MyPageLikeState();
}

class _MyPageLikeState extends State<MyPageLike> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(basicPadding),
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: basicPadding),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mediumGray),
                  height: 60.h,
                  child: Padding(
                    padding: const EdgeInsets.all(stylePadddig),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.songname} $index',
                          style: TextStyle(
                              fontSize: textStyleSize.sp, color: white),
                        ),
                        Spacer(flex: 1),
                        IconButton(
                          color: white,
                          padding: EdgeInsets.only(bottom: 22),
                          icon: Icon(
                            Icons.favorite,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
