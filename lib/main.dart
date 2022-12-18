import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_user/pages/iamport_test.dart';
import 'package:flutter_test_user/pages/payment/payment.dart';
import 'package:flutter_test_user/pages/payment/payment_result.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IamportTest(),
      navigatorKey: navigatorKey,
      routes: {
        "/payment": (context) => Payment(),
        "/result": (context) => PaymentResult(),
      },
    );
  }
}
