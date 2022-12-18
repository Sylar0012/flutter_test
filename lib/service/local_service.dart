import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test_user/core/http_connector.dart';
import 'package:flutter_test_user/core/iamport_token.dart';
import 'package:flutter_test_user/dto/resp/response_dto.dart';
import 'package:flutter_test_user/util/util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

const secureStorage = FlutterSecureStorage();

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single();
  LocalService._single();
  factory LocalService() {
    return _instance;
  }

  Future<void> fetchJwtToken() async {
    String? deviceJwtToken = await secureStorage.read(key: "access_token");
    if (deviceJwtToken != null) {
      Response response = await httpConnector.getInitSession("/access_token", deviceJwtToken);
      ResponseDto responseDto = toResponseDto(response);

      if (responseDto.code == 0) {
        IamportToken.successAuthentication(deviceJwtToken);
      }
    }
  }

  Future<void> fetchDeleteJwtToken() async {
    Logger().d("jwt remove");
    await secureStorage.delete(key: "jwtToken");
  }
}
