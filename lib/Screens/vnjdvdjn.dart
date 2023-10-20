import 'package:flutter/material.dart';

class MyHomePagesss extends StatefulWidget {
  @override
  _MyHomePagesssState createState() => _MyHomePagesssState();
}

class _MyHomePagesssState extends State<MyHomePagesss>
    with SingleTickerProviderStateMixin {
  bool isDrawerOpen = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top to Bottom Drawer'),
        leading: GestureDetector(
          onTap: () {
            setState(() {
              isDrawerOpen = !isDrawerOpen;
            });
          },
          child: Icon(Icons.menu),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Drawer
          if (isDrawerOpen)
            Positioned(
              top: AppBar().preferredSize.height,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.blue,
                  child: Center(
                    child: Text('Your drawer content goes here'),
                  ),
                ),
              ),
            ),
          // Your content goes here
          Positioned.fill(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Text('Content for Tab 1'),
                ),
                Center(
                  child: Text('Content for Tab 2'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
