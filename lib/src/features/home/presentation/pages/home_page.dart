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
                  return Stack(
                    children: [
                      const BackGroundContainer(),
                      CustomScrollView(
                        controller: _pageScrollController,
                        slivers: [
                          SliverStack(
                            children: [
                              SliverList.list(
                                children: [
                                  const WeatherHomePage(),
                                  context.sizedBox(height: 15),
                                  Padding(
                                      padding: context.padding(horizontal: 12),
                                      child: const SearchBarButton()),
                                  context.sizedBox(height: 15),
                                  Padding(
                                    padding: context.padding(horizontal: 12),
                                    child: RowTopicButton(
                                      pageScrollController:
                                          _pageScrollController,
                                      onIndetifyPressed: () =>
                                          _onIdentifyPressed(context: context),
                                      onCommunityPressed: () =>
                                          _onCommunityPressed(context: context),
                                      onGalleryPressed: () =>
                                          _onGalleryPressed(context: context),
                                    ),
                                  ),
                                  const Center(
                                    child: SharkeAnimationHomePage(),
                                  ),
                                  context.sizedBox(height: 80),
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
                                  context.sizedBox(height: 50),
                                  CustomTitle(
                                    title: translate(context).popularTopic,
                                    horizontalPadding: 12,
                                  ),
                                  context.sizedBox(height: 12),
                                  const PolularPlantsButton(),
                                  context.sizedBox(height: 50),
                                ],
                              ),
                              AppBarHomePage(
                                appBarTitle: _appBarTitle,
                                appBarBackGroundOpacity:
                                    _appBarBackGroundOpacity,
                                actionWidgetOpacity: _actionWidgetOpacity,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  );
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
    if (offset >= 255) {
      if (_appBarTitle != ZoomOutButtonHomePage.scrollDown()) {
        _openScrollDownButton();
      }
    } else if (_pageScrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        _pageScrollController.offset < 255) {
      _openScrollUpButton();
    } else {
      if (_appBarTitle != const SizedBox()) {
        _closeZoomOutButton();
      }
    }
  }

  void _openScrollUpButton() {
    if (_appBarTitle != ZoomOutButtonHomePage.scrollUp()) {
      setState(() {
        _appBarTitle = ZoomOutButtonHomePage.scrollUp();
      });
    }
  }

  void _openScrollDownButton() {
    setState(() {
      _appBarTitle = ZoomOutButtonHomePage.scrollDown();
      // _appBarTitle = Text(
      //   'eee',
      //   style: theme(context).textTheme.titleMedium,
      // );
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

  void _onIdentifyPressed({required BuildContext context}) {
    _showTopicModal(
      context: context,
      child: const PlantIdentifyModal(),
    );
    _changeTopic(topicSymbol: TopicSymbol.identification, context: context);
  }

  void _onCommunityPressed({required BuildContext context}) {
    _showTopicModal(
      context: context,
      child: const CreateCommunityPostModal(),
    );
    _changeTopic(topicSymbol: TopicSymbol.community, context: context);
  }

  void _onGalleryPressed({required BuildContext context}) {
    _showTopicModal(context: context, child: const GalleryModal());
    _changeTopic(topicSymbol: TopicSymbol.gallery, context: context);
  }

  void _showTopicModal({required BuildContext context, required Widget child}) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.8,
      child: child,
    );
  }

  void _changeTopic({
    required TopicSymbol topicSymbol,
    required BuildContext context,
  }) {
    context
        .read<HomePageBloc>()
        .add(HomePageChangetTopic(topicSymbol: topicSymbol));
  }

  @override
  bool get wantKeepAlive => true;
}
