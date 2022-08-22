import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyword/controller/home_controller.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _controller = Get.put(HomeController());

  Future<void> _isLoading() async {
    await _controller.loadApps();

    Get.offAndToNamed('/home');

    return Future.value();
  }

  @override
  void initState() {
    _isLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Keyword",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
