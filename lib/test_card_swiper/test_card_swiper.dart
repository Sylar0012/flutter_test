import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestCardSwiper extends StatefulWidget {
  const TestCardSwiper({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  _TestCardSwiperState createState() => _TestCardSwiperState();
}

class _TestCardSwiperState extends State<TestCardSwiper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 300,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/메인${index + 1}.png",
                  fit: BoxFit.cover,
                ),
              );
            },
            itemCount: 4,
            pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor: Colors.orange)),
            viewportFraction: 0.8,
            scale: 0.8,
          ),
        ),
      ),
    );
  }
}
