import 'package:flutter/material.dart';
import 'package:flutter_test_user/alert_dialog/alert_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _buildScaffold(context),
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _bulidStore(context, "6/20 (월)", "배달중", "치킨", "네네치킨", "후라이드 치킨 외 2개 43,000원"),
        ],
      ),
    );
  }
}

Widget _bulidStore(BuildContext context, String orderDay, String ordeyState, String img, String storeName, String order) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "${orderDay}",
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${ordeyState}",
                      ),
                    ],
                  ),
                ),
                MyAlertDialog(),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person_outlined),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${storeName}",
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "${order}",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Container(color: Colors.grey[200], height: 16),
    ],
  );
}
