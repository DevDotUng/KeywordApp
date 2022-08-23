import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyword/component/custom_dropdownbutton.dart';

import '../controller/detail_controller.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _controller = Get.put(DetailController(applicationId: Get.arguments));

  List<String> _dropdownList = ['Flutter', 'Android', 'iOS', 'RN'];
  String dropdownValue = 'Flutter';

  late PageController _pageController;
  double _page = 0;
  int _intPage = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(_onPageViewScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageViewScroll() {
    setState(() {
      _page = _pageController.page!;
      if (_page - _page.toInt() <= 0.5)
        _intPage = _page.toInt();
      else
        _intPage = _page.toInt() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => Scaffold(
        appBar: _appbar(),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _controller.result == null
              ? 0
              : _controller.result?.screenshotWithPoint.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    _controller.result!.screenshotWithPoint[index].imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                ...List.generate(
                  _controller.result!.screenshotWithPoint[index]
                      .pointWithKeyword.length,
                  (jndex) => keywordPoint(index, jndex),
                )
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
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        _controller.result == null
            ? ""
            : _controller.result!.screenshotWithPoint[_intPage].role,
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios, color: Colors.black),
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
      ],
    );
  }

  Widget keywordPoint(int index, int jndex) {
    // left, top
    if (_controller.result!.screenshotWithPoint[index].pointWithKeyword[jndex]
                .leftOffset !=
            0 &&
        _controller.result!.screenshotWithPoint[index].pointWithKeyword[jndex]
                .topOffset !=
            0) {
      return Positioned(
        left: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].leftOffset!
            .toDouble(),
        top: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].topOffset!
            .toDouble(),
        child: CustomButtonTest(
            dropdownList: _controller.result!.screenshotWithPoint[index]
                .pointWithKeyword[jndex].keywords),
      );
    } // right, top
    else if (_controller.result!.screenshotWithPoint[index]
                .pointWithKeyword[jndex].rightOffset !=
            0 &&
        _controller.result!.screenshotWithPoint[index].pointWithKeyword[jndex]
                .topOffset !=
            0) {
      return Positioned(
        right: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].rightOffset!
            .toDouble(),
        top: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].topOffset!
            .toDouble(),
        child: CustomButtonTest(
            dropdownList: _controller.result!.screenshotWithPoint[index]
                .pointWithKeyword[jndex].keywords),
      );
    } // right, bottom
    else if (_controller.result!.screenshotWithPoint[index]
                .pointWithKeyword[jndex].rightOffset !=
            0 &&
        _controller.result!.screenshotWithPoint[index].pointWithKeyword[jndex]
                .bottomOffset !=
            0) {
      return Positioned(
        right: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].rightOffset!
            .toDouble(),
        bottom: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].bottomOffset!
            .toDouble(),
        child: CustomButtonTest(
            dropdownList: _controller.result!.screenshotWithPoint[index]
                .pointWithKeyword[jndex].keywords),
      );
    } // left, bottom
    else if (_controller.result!.screenshotWithPoint[index]
                .pointWithKeyword[jndex].leftOffset !=
            0 &&
        _controller.result!.screenshotWithPoint[index].pointWithKeyword[jndex]
                .bottomOffset !=
            0) {
      return Positioned(
        left: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].leftOffset!
            .toDouble(),
        bottom: _controller.result!.screenshotWithPoint[index]
            .pointWithKeyword[jndex].bottomOffset!
            .toDouble(),
        child: CustomButtonTest(
            dropdownList: _controller.result!.screenshotWithPoint[index]
                .pointWithKeyword[jndex].keywords),
      );
    }
    return Container();
  }
}
