import 'package:mb_base_dt/api/base/endpoints.repository.dart' as endpoints;

import 'package:mb_base_dt/models/response.model.dart';

import 'package:mb_base_dt/helpers/http.helper.dart';

class CommonService {
  Future<Response?> listUsers() async {
    Response response = Response();
    String url = endpoints.common.listUsers;
    Map<String, dynamic> data = {
    };

    await HttpRequest.get(url, data)
      .then((res) {
        response.code = res?.statusCode;
        response.data = res?.data;
        response.message = res?.statusMessage;
      })
      .catchError((e) {
        response.code = 500;
        response.data = e;
        response.message = 'Error en Common';
      });

    return response;
  }
}