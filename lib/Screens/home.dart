import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:phone_pay/Screens/all_matches.dart';
import 'package:phone_pay/Screens/all_movie_screen.dart';

import 'netflix_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int numbers) {
    setState(() {
      _selectedTab = _SelectedTab.values[numbers];
    });
  }

  Widget _buildTabContent(_SelectedTab tab) {
    switch (tab) {
      case _SelectedTab.home:
        return Container(child: const NetFlixscreen());
        // Add content for other tabs as needed
      case _SelectedTab.favorite:
        case _SelectedTab.search:
          return const AllMovieScreen();
          case _SelectedTab.person:
            return const AllMatches();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _buildTabContent(_selectedTab),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.brown.shade200,
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              unselectedColor: Colors.black,
              selectedColor: const Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.favorite),
              unselectedColor: const Color(0xff6A3C3CFF),
              selectedColor: const Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.search),
              unselectedColor: const Color(0xffF28484FF),
              selectedColor: const Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.person),
              unselectedColor: const Color(0xff6a3f3fff),
              selectedColor: const Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab {
  home,
  favorite,
  search,
  person
}
