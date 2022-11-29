import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
            builder: (BuildContext context) {
              return AlertDialog(
                alignment: Alignment.bottomCenter,
                insetPadding: EdgeInsets.zero, // 패딩 설정
                actions: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        child: Expanded(
                          child: const Text(
                            '가게보기',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text(
                          '주문내역 삭제',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text(
                          '닫기',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              );
            });
      },
      icon: Icon(
        Icons.more_vert_rounded,
        size: 50,
      ),
    );
  }
}
