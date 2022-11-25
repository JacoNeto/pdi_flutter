import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    Get.log('Base Connect Inicializado');

    //URL base
    httpClient.baseUrl =
        'https://jaconeto.pythonanywhere.com/opencvdemo/default';

    httpClient.addResponseModifier((request, response) {
      if (Get.isLogEnable) {
        debugPrint('${request.method}');
        debugPrint('${request.url}');
      }
      debugPrint('${response.body}');
      return response;
    });

    httpClient.defaultContentType = 'application/json; charset=utf-8';

    //Tempo de duração das requisições
    httpClient.timeout = const Duration(seconds: 15);

    //Em caso de falha, número de tentativas
    httpClient.maxAuthRetries = 4;
  }
}

class ColorConnect extends BaseConnect {
  Future<dynamic> equalize(Uint8List image) async {
    Get.log('PersonPlace: report');
    final response = await post(
        'https://jaconeto.pythonanywhere.com/opencvdemo/default/equalize',
        <String, dynamic>{"image": image});
    if (response.isOk) {
      print(response.bodyString);
      return true;
    }
    return false;
  }
}
