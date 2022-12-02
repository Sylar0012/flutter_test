import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double buttonSize = 36;
    return Scaffold(
      body: Column(
        children: [
          LikeButton(
            size: buttonSize,
            circleColor: CircleColor(start: Colors.orangeAccent, end: Colors.orange),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Colors.pink,
              dotSecondaryColor: Colors.orange,
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                CupertinoIcons.heart_fill,
                color: isLiked ? Colors.redAccent : Colors.grey,
                size: buttonSize,
              );
            },
            likeCount: 665,
            countBuilder: (count, isLiked, text) {
              var color = isLiked ? Colors.redAccent : Colors.grey;
              Widget result;
              if (count == 0) {
                result = Text(
                  "love",
                  style: TextStyle(color: color),
                );
              } else
                result = Text(
                  text,
                  style: TextStyle(color: color),
                );
              return result;
            },
          ),
        ],
      ),
    );
  }
}
