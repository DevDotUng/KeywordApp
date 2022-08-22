import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyword/models/screenshot_by_role.dart';

class CustomGridView extends StatefulWidget {
  CustomGridView(
      {Key? key, required this.index, required this.screenshotByRole})
      : super(key: key);

  int index;
  ScreenshotByRole screenshotByRole;

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  List<List<int>> groupBox = [[], []];

  @override
  void initState() {
    for (int i = 0; i < widget.screenshotByRole.screenshots.length; i++) {
      groupBox[i % 2].add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.screenshotByRole.role,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                children: List.generate(
                  groupBox[index].length,
                  (jndex) => Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            Get.toNamed("/detail");
                          },
                          child: Image.network(widget
                              .screenshotByRole
                              .screenshots[index + 2 * jndex]
                              .imageUrl), // 총 순서는 index + jndex + jndex이다.
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}
