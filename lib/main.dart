import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyword/bindings/base_bindings.dart';
import 'package:keyword/pages/detail.dart';
import 'package:keyword/pages/home.dart';
import 'package:keyword/pages/screenshot_list.dart';
import 'package:keyword/pages/splash.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/',
        page: () => Splash(),
        binding: BaseBindings(),
      ),
      GetPage(
        name: '/home',
        page: () => Home(),
      ),
      GetPage(
        name: '/screenshotList',
        page: () => ScreenshotList(),
      ),
      GetPage(
        name: '/detail',
        page: () => Detail(),
      ),
    ],
  ));
}
