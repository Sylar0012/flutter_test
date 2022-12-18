import 'package:flutter/material.dart';
import 'package:flutter_test_user/dto/req/payment_data.dart';
import 'package:flutter_test_user/model/utils.dart';
import 'package:flutter_test_user/pages/payment/iamprot_payment.dart';
import 'package:flutter_test_user/pages/payment/payment_test.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentData data = ModalRoute.of(context)!.settings.arguments as PaymentData;

    return IamportPayment(
      appBar: AppBar(
        title: Text('아임포트 결제'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentTest()));
          },
        ),
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
      userCode: Utils.getUserCodeByPg(data.pg),
      data: data,
      callback: (Map<String, String> result) {
        Navigator.pushReplacementNamed(context, '/result', arguments: result);
      },
    );
  }
}
