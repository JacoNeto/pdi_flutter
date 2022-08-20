import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The [AppController] is responsible to every state change of the global app
/// widgets.
///
/// To change the themeData from dark mode to light mode, call the
/// [switchTheme()] function
class AppController extends GetxController {
  // changes the theme from light to dark
  void switchTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }
}
