import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/core/app_controller.dart';

import 'core/app.dart';

/// Please, follow these patterns when coding:
///
/// Lexical patterns
/// [Classes]: UpperCamelCase
/// [Attributes]: lowerCamelCase
/// [Private Attributes]: _lowerCamelCase
/// [Methods]: lowerCamelCase()
/// [Private Methods]: _lowerCamelCase()
/// [Package names]: underline_pattern
/// [Dart File names]: underline_pattern.dart
///
/// Directory patterns
/// [New Page or Screen or Big Feature]:
///   lib -> views -> new_package/new_page.dart
/// [New Component or Feature in an existing screen]:
///   lib -> views -> package/.*/package -> components/component.dart

/// [IMPORTANT!]
/// Create new components extracting new widgets in new files, not extracting
/// widget methods in the same file!
///
/// ex:
/// [Bad]: Widget _myWidget(BuildContext context, props)
/// [Good]: stl or stful -> MyWidget(props: props)

// Run the app
void main() {
  initialize();
  runApp(const PDIFlutter());
}

// Add in this function anything you have to do before the app is
// loaded.
void initialize() {
  Get.lazyPut(() => AppController());
}
