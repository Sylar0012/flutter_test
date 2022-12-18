import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_user/dto/req/login_req_dto.dart';
import 'package:flutter_test_user/dto/req/payment_cancel_req_dto.dart';
import 'package:flutter_test_user/dto/resp/response_dto.dart';
import 'package:flutter_test_user/main.dart';
import 'package:flutter_test_user/pages/payment/payment_test.dart';
import 'package:flutter_test_user/pages/payment_cancel/payment_cancel_test.dart';
import 'package:flutter_test_user/service/payment_cancel_service.dart';
import 'package:logger/logger.dart';

/**
 * View -> Controller 요청
 * Controller -> Service 요청
 * Service -> 스프링서버 요청
 * Controller -> ViewModel 응답
 *
 *
 * Controller 책임 : View요청 받고,
 *                  Service에게 통신요청하고,
 *                  화면 비지니스 로직 처리(페이지이동, 알림창, ViewModel 데이터 담기)
 * Service 책임 : 통신하고, 파싱하고, 데이터 관련 처리
 * ViewModel 책임 : 뷰 데이터 상태 관리
 * model 책임 : ViewModel 데이터 전담
 * Provider 책임 : 전역 뷰 관련 상태 관리
 * static 클래스 : 전역 데이터 관리 (세션 같은 것)
 */

final paymentCancelController = Provider<PaymentCancelController>((ref) {
  return PaymentCancelController(ref);
});

class PaymentCancelController {
  final mContext = navigatorKey.currentContext;
  final PaymentCancelService paymentCancelService = PaymentCancelService();
  final Ref _ref;

  PaymentCancelController(this._ref);

  Future<void> login() async {
    // 1. DTO 변환
    LoginReqDto loginReqDto = LoginReqDto();
    // 2. 통신 요청
    ResponseDto responseDto = await paymentCancelService.fetchPaymentlogin(loginReqDto);
    Logger().d("로그인  : ${responseDto.code}");
    //3. 비지니스 로직 처리
    if (responseDto.code == 0) {
      Logger().d("로그인 성공시 바디 데이터 : ${responseDto.response}");
      Navigator.push(mContext!, MaterialPageRoute(builder: (context) => PaymentCancelTest()));
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
          content: Text("아이디 또는 비밀번호가 다릅니다."),
        ),
      );
    }
  }

  Future<void> paymentCancel(String impUid, String merchantUid, int amount, int taxFree, String checkSum, String reason) async {
    PaymentsCancelReqDto paymentsCancelReqDto =
        PaymentsCancelReqDto(impUid: impUid, merchantUid: merchantUid, amount: amount, taxFree: taxFree, checkSum: checkSum, reason: reason);

    ResponseDto responseDto = await paymentCancelService.fetchPaymentCancel(paymentsCancelReqDto);
    Logger().d("responseDto : ${responseDto.code}");
    Logger().d("responseDto : ${responseDto.message}");
    Logger().d("responseDto : ${responseDto.response}");
    if (responseDto.code == 0) {
      Navigator.push(mContext!, MaterialPageRoute(builder: (context) => PaymentTest()));
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
          content: Text("아이디 또는 비밀번호가 다릅니다."),
        ),
      );
    }
  }
}
