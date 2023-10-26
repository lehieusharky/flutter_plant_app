part of 'part_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _pageScrollController = ScrollController();
  double _appBarBackGroundOpacity = 0;
  double _actionWidgetOpacity = 0;
  Widget? _appBarTitle = const SizedBox();

  @override
  void initState() {
    super.initState();

    _pageScrollController.addListener(() {
      _handleOpacity(_pageScrollController.offset);

      _handleVisibleZoomOutButton(_pageScrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => HomePageBloc(),
          child: BlocConsumer<HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is HomePageDeterminePositionSuccess) {
                _handleWhenDeterminePosition(context, state);
              }
            },
            builder: (context, state) {
              return BlocBuilder<MyAppBloc, MyAppState>(
                builder: (context, state) {
                  return Stack(children: [
                    const BackGroundContainer(),
                    CustomScrollView(
                      controller: _pageScrollController,
                      slivers: [
                        SliverStack(
                          children: [
                            SliverList.list(children: [
                              const WeatherHomePage(),
                              context.sizedBox(height: 15),
                              Padding(
                                  padding: context.padding(horizontal: 12),
                                  child: const SearchBarButton()),
                              context.sizedBox(height: 15),
                              Padding(
                                padding: context.padding(horizontal: 12),
                                child: RowTopicButton(
                                  pageScrollController: _pageScrollController,
                                ),
                              ),
                              const Center(child: SharkeAnimationHomePage()),
                              context.sizedBox(height: 50),
                              CustomTitle(
                                title: translate(context).today,
                                horizontalPadding: 12,
                              ),
                              context.sizedBox(height: 10),
                              const ListPostHomePage(),
                              context.sizedBox(height: 5),
                              Center(
                                child: CustomSeeAllButton(
                                  onPressed: () {},
                                ),
                              ),
                              context.sizedBox(height: 20),
                              CustomTitle(
                                title: translate(context).popularTopic,
                                horizontalPadding: 12,
                              ),
                              context.sizedBox(height: 12),
                              const PolularPlantsButton(),
                              context.sizedBox(height: 50),
                            ]),
                            AppBarHomePage(
                              appBarTitle: _appBarTitle,
                              appBarBackGroundOpacity: _appBarBackGroundOpacity,
                              actionWidgetOpacity: _actionWidgetOpacity,
                            ),
                          ],
                        )
                      ],
                    )
                  ]);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleWhenDeterminePosition(
      BuildContext context, HomePageDeterminePositionSuccess state) {
    _getWeatherInfomation(
      context: context,
      lat: state.position!.latitude.toString(),
      long: state.position!.longitude.toString(),
    );
  }

  void _handleOpacity(double offset) {
    setState(() {
      _appBarBackGroundOpacity = (offset / 150).clamp(0.0, 1.0);
      _actionWidgetOpacity = (offset / 300).clamp(0.0, 1.0);
    });
  }

  void _handleVisibleZoomOutButton(double offset) {
    if (offset >= 300) {
      if (_appBarTitle != const ZoomOutButtonHomePage()) {
        _openZoomOutButton();
      }
    } else {
      if (_appBarTitle != const SizedBox()) {
        _closeZoomOutButton();
      }
    }
  }

  void _openZoomOutButton() {
    setState(() {
      _appBarTitle = const ZoomOutButtonHomePage();
    });
  }

  void _closeZoomOutButton() {
    setState(() {
      _appBarTitle = const SizedBox();
    });
  }

  void _getWeatherInfomation({
    required String lat,
    required String long,
    required BuildContext context,
  }) {
    context
        .read<HomePageBloc>()
        .add(HomePageGetWeatherInfomation(lat: lat, long: long));
  }

  @override
  bool get wantKeepAlive => true;
}
