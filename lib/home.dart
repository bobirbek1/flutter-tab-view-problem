import 'package:flutter/material.dart';
import 'package:scroll_problem/top.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < 2; i++) ...{const TopWidget()},
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
              ],
            ),
            
               [ const SizedBox(
                  height: 100,
                  child: Center(
                    child: Text('First tab content with 100 height'),
                  ),
                ),
                const SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('Second tab content with 200 height'),
                  ),
                ),][tabController.index],
              
            for (int i = 0; i < 6; i++) ...{const TopWidget()},
          ],
        ),
      ),
    );
  }
}
