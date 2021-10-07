import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TestDialog extends StatelessWidget {
  const TestDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          child: Text("data"),
          onTap: () {
            Get.bottomSheet(
              Container(
                height: 526.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                      children: [
                        Text(
                          '곡이름',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("날짜 2021.10.07 13:20"),
                                    SizedBox(height: 10.h),
                                    Container(
                                      width: 330.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                            Color(0xffECECEC),
                                            Color(0xffD6D6D6),
                                            Color(0xff9D9D9D),
                                          ])),
                                      child: Text(
                                        "점수",
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(height: 21),
                                  ],
                                ),
                              );
                            })
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
