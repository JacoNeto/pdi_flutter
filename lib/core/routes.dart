import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/home/home_page.dart';

class RouteGenerator {
  static const HOME_PAGE = '/';
  static const UNKNOWN_PAGE = '/notFound';

  //Controla as rotas e dependĂȘncias
  static List<GetPage> routes() {
    return [
      //Route to Home Page
      GetPage(
        name: HOME_PAGE,
        page: () => HomePage(
          title: "PDI Flutter",
        ),
      ),

      // Error Route
      GetPage(
        name: UNKNOWN_PAGE,
        page: () => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ALGO DEU ERRADO'),
          ),
        ),
      ),
    ];
  }
}
