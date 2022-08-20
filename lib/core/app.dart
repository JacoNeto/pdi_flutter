// Root of the widget tree
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/core/routes.dart';

/// The [PDIFlutter] widget is the root of the app,
/// therefore the root of the widget tree
class PDIFlutter extends StatelessWidget {
  const PDIFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PDI Flutter',
      theme: ThemeData.dark(),
      initialRoute: RouteGenerator.HOME_PAGE,
      getPages: RouteGenerator.routes(),
      debugShowCheckedModeBanner: false, // avoid annoying debug banner
    );
  }
}
