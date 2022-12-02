import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
                delegate: SliverChildListDelegate([
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
              Text("OverFlow Test"),
            ]))
          ];
        },
        body: NSViewTest(),
      ),
    );
  }
}

class NSViewTest extends StatefulWidget {
  const NSViewTest({Key? key}) : super(key: key);

  @override
  State<NSViewTest> createState() => _NSViewTestState();
}

class _NSViewTestState extends State<NSViewTest> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                children: [
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                  Text("OverFlow Test"),
                ],
              ),
              Container(color: Colors.green),
              Container(color: Colors.yellow),
            ],
          ),
        ),
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Text("메뉴", style: TextStyle(color: Colors.black)),
        Text("정보", style: TextStyle(color: Colors.black)),
        Text("리뷰", style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
