import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:keyword/models/Keyword.dart';

class CustomButtonTest extends StatefulWidget {
  CustomButtonTest({Key? key, required this.dropdownList}) : super(key: key);
  List<Keyword> dropdownList;

  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class _CustomButtonTestState extends State<CustomButtonTest>
    with TickerProviderStateMixin {
  List<String> _dropdownList = [];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    for (int i = 0; i < widget.dropdownList.length; i++) {
      _dropdownList.add(widget.dropdownList[i].keyword);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                  color: Colors.white,
                ),
                child: Icon(Icons.question_mark, size: 15),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(0, -_controller.value * 5),
                  child: child,
                );
              },
            ),
          ),
        ),
        customItemsIndexes: const [3],
        customItemsHeight: _dropdownList.length * 4,
        items: _dropdownList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
        itemHeight: 48,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }

  Widget _a() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
            color: Colors.white,
          ),
          child: Icon(Icons.question_mark, size: 15),
        ),
      ),
    );
  }
}
