part of 'part_dash_board_page.dart';

UserModel? userInfo;

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
      body: BlocBuilder<MyAppBloc, MyAppState>(
        builder: (context, state) {
          return BlocProvider(
            create: (context) => DashBoardBloc(),
            child: BlocConsumer<DashBoardBloc, DashBoardState>(
              listener: (context, state) {
                if (state is DashBoardGetUserInfomationSuccess) {
                  Logger().f('Get user infomation success');
                  userInfo = state.userModel;
                }
              },
              builder: (context, state) {
                return PageView(
                  physics: const NeverScrollableScrollPhysics(),
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
                );
              },
            ),
          );
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
          items: _buildItemBottom(),
        ),
      ),
    );
  }

  List<SalomonBottomBarItem> _buildItemBottom() {
    return [
      itemBottomGreen(
        icon: const Icon(FontAwesomeIcons.tree),
        title: translate(context).garden,
      ),
      itemBottomGreen(
        icon: const Icon(Icons.home),
        title: translate(context).home,
      ),
      itemBottomGreen(
        icon: const Icon(Icons.settings),
        title: translate(context).setting,
      ),
    ];
  }
}
