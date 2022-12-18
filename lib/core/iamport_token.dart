// main 시작전에 확인이 필요해서 provider가 아닌 static으로 관리
import 'package:flutter_test_user/service/local_service.dart';

class IamportToken {
  static String? _accessToken;

  static get accessToken => _accessToken;

  static void successAuthentication(String accessToken) {
    _accessToken = accessToken;
  }

  static Future<void> removeAuthentication() async {
    _accessToken = null;
    await LocalService().fetchDeleteJwtToken();
  }

  static Map<String, String> getJwtTokenHeader(Map<String, String> headers) {
    return IamportToken._accessToken == null ? headers : {...headers, "Authorization": IamportToken._accessToken!};
  }
}
