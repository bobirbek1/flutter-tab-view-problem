import 'package:flutter/material.dart';
import 'package:scroll_problem/top.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < 2; i++) ...{TopWidget()},
            DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                      Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Container(
                      height: 100,
                      child: Center(
                        child: Text('First tab content with 100 height'),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Center(
                        child: Text('Second tab content with 200 height'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            for (int i = 0; i < 6; i++) ...{TopWidget()},
          ],
        ),
      ),
    );
  }
}
