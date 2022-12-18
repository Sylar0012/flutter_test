import 'dart:convert';

import 'package:flutter_test_user/core/http_connector.dart';
import 'package:flutter_test_user/core/iamport_token.dart';
import 'package:flutter_test_user/dto/req/login_req_dto.dart';
import 'package:flutter_test_user/dto/req/payment_cancel_req_dto.dart';
import 'package:flutter_test_user/dto/resp/response_dto.dart';
import 'package:flutter_test_user/service/local_service.dart';
import 'package:flutter_test_user/util/util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class PaymentCancelService {
  final HttpConnector httpConnector = HttpConnector();

  static final PaymentCancelService _instance = PaymentCancelService._single();
  PaymentCancelService._single();
  factory PaymentCancelService() {
    return _instance;
  }

  Future<ResponseDto> fetchPaymentCancel(PaymentsCancelReqDto paymentsCancelReqDto) async {
    String requestBody = jsonEncode(paymentsCancelReqDto.toJson());
    Logger().d("requestBody : ${requestBody.toString()}");
    Logger().d("IamportToken : ${IamportToken.accessToken}");
    Response response = await httpConnector.postInitSession("payments/cancel", requestBody, IamportToken.accessToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 0) {
      Logger().d("환불 성공");
    }
    return responseDto;
  }

  Future<ResponseDto> fetchPaymentlogin(LoginReqDto loginReqDto) async {
    // 1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());
    Logger().d("requestBody : $requestBody");

    // 2. 통신 시작
    Response response = await httpConnector.post("/users/getToken", requestBody);
    ResponseDto responseDto = toResponseDto(response);

    Logger().d("responseDto : ${responseDto.response}");
    // 3. 토큰 받기
    String accessToken = responseDto.response["access_token"].toString();
    Logger().d("accessToken : $accessToken");
    // 4. 토큰을 디바이스와 세션에 저장
    await secureStorage.write(key: "access_token", value: accessToken); // 자동 로그인시 필요

    Logger().d(accessToken);
    // 5. ResponseDto에서 User 꺼내기

    // 6. AuthProvider에 로긴 정보 저장
    IamportToken.successAuthentication(accessToken);

    Logger().d("토큰 저장 ? : ${IamportToken.accessToken}");

    return responseDto; // ResponseDto 응답
  }
}
