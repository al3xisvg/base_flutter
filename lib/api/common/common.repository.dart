import 'package:mb_base_dt/api/common/common.service.dart';

import 'package:mb_base_dt/models/response.model.dart';

import 'package:mb_base_dt/services/connection.service.dart';

class CommonRepository {
  CommonService api = CommonService();

  Future<Response?> listUsers() async {
    Response? response = Response();
    bool hasConnection = await Connection.hasConnection();
    if (hasConnection) {
      response = await api.listUsers();
    } else {
      response.message = 'Te encuentras offline';
    }
    return response;
  }
}