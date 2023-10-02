import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/dash_board/widgets/item_bottom_nav_bar.dart';
import 'package:plant_market/src/features/home/pages/home_page.dart';
import 'package:plant_market/src/features/setting/page/setting_page.dart';
import 'package:plant_market/src/features/user/page/user_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  var _currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          UserPage(),
          HomePage(),
          SettingPage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: context.padding(horizontal: 40, vertical: 2.5),
        child: SalomonBottomBar(
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          items: [
            itemBottomGreen(icon: const Icon(Icons.person), title: 'User'),
            itemBottomGreen(icon: const Icon(Icons.home), title: 'Home'),
            itemBottomGreen(icon: const Icon(Icons.settings), title: 'Setting'),
          ],
        ),
      ),
    );
  }
}
