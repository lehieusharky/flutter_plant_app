part of 'part_dash_board_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final PageController _pageController = PageController(initialPage: 1);
  var _currentIndex = 1;

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
            itemBottomGreen(
              icon: const Icon(Icons.person),
              title: translate(context).user,
            ),
            itemBottomGreen(
              icon: const Icon(Icons.home),
              title: translate(context).home,
            ),
            itemBottomGreen(
              icon: const Icon(Icons.settings),
              title: translate(context).setting,
            ),
          ],
        ),
      ),
    );
  }
}
