import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyword/component/custom_gridview.dart';
import 'package:keyword/controller/screenshot_list_controller.dart';

class ScreenshotList extends GetView<ScreenshotListController> {
  final _controller =
      Get.put(ScreenshotListController(applicationId: Get.arguments));

  List<String> _dropdownList = ['Category', 'Android', 'iOS', 'RN'];
  String dropdownValue = 'Category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: GetBuilder<ScreenshotListController>(
          builder: (_) => Column(
            children: [
              _appInfo(),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.result == null
                        ? 0
                        : _controller.result!.screenshotsByRole.length,
                    itemBuilder: (context, index) {
                      return _controller.result == null
                          ? Container()
                          : CustomGridView(
                              index: index,
                              screenshotByRole:
                                  _controller.result!.screenshotsByRole[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      title: const Text(
        "Keyword",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _appInfo() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: _controller.result == null
                  ? null
                  : DecorationImage(
                      image: NetworkImage(_controller.result!.appInfo.iconUrl),
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _controller.result == null
                        ? ''
                        : _controller.result!.appInfo.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    _controller.result == null
                        ? ''
                        : _controller.result!.appInfo.category,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                _controller.result == null
                    ? ''
                    : _controller.result!.appInfo.corperation,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
