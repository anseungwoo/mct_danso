import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/controllers/controllers.dart';

class SheetTestScreen extends StatefulWidget {
  SheetTestScreen(
      {Key? key,
      required this.sheetData,
      required this.songTitle,
      required this.jangdan})
      : super(key: key);
  final String sheetData;
  final String songTitle;
  final String jangdan;

  @override
  _SheetTestScreenState createState() => _SheetTestScreenState();
}

class _SheetTestScreenState extends State<SheetTestScreen> {
  final SheetController sheetController = Get.put(SheetController());

  @override
  void initState() {
    super.initState();
    sheetController.jungGanBoSheet(
      songTitle: widget.songTitle,
      jangdan: widget.jangdan,
      songSheet: widget.sheetData,
    );
  }

  @override
  void dispose() {
    super.dispose();
    sheetController.deleteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('danso function music sheet'),
      ),
      body: Column(
        children: [
          Text(widget.songTitle),
          Text(widget.jangdan),
          Text(widget.sheetData),
          Expanded(
            child: GetBuilder<SheetController>(
              init: sheetController,
              builder: (controller) {
                return ListView.builder(
                  itemCount: sheetController.koSheet.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Text('${sheetController.koSheet[index]}'));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
