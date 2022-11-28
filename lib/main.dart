import 'package:flutter/material.dart';
import 'package:flutter_test_user/test_card_swiper/test_card_swiper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestCardSwiper(title: "CardSwiper 테스트"),
    );
  }
}
