import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyword/controller/home_controller.dart';

class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);

  final _controller = Get.put(HomeController());

  List<String> _dropdownList = ['Category', 'Android', 'iOS', 'RN'];
  String dropdownValue = 'Category';

  void toScreenshotListPage(int index) {
    Get.toNamed('/screenshotList',
        arguments: _controller.list[index].appInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: GetBuilder<HomeController>(
        builder: (_) => ListView.builder(
          itemCount: _controller.count,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appInfo(index),
                _appScreenshotList(index),
              ],
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "Keyword",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.code),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {},
          items: _dropdownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _appInfo(int index) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => toScreenshotListPage(index),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(_controller.list[index].appInfo.iconUrl),
                  fit: BoxFit.fill,
                ),
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
                  GestureDetector(
                    onTap: () => toScreenshotListPage(index),
                    child: Text(
                      _controller.list[index].appInfo.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    _controller.list[index].appInfo.category,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                _controller.list[index].appInfo.corperation,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _appScreenshotList(int index) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: _controller.list[index].screenshots.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, jndex) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(8, 8),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(-8, -8),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/detail",
                        arguments: _controller.list[index].appInfo.id);
                  },
                  child: Image.network(
                      _controller.list[index].screenshots[jndex].imageUrl),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
