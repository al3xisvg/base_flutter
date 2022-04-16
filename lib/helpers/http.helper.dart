import 'package:dio/dio.dart';

import 'package:mb_base_dt/services/logs.service.dart';

String ctx = 'HTTP_REQUEST';

class HttpRequest {

  static Future<Response?> get(String url, Map<String, dynamic> data) async {
    Logs.debug(ctx, 'i', url);
    Response? response;
    try {
      response = await Dio().get(url, options: Options(headers: { 'content-type': 'application/json' }));
    } catch (e) {
      Logs.debug(ctx, 'e', e.toString());
    }
    return response;
  }
}