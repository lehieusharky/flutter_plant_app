part of 'part_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _pageScrollController = ScrollController();
  bool _isAppBarExist = false;
  Widget? _appBarTitle = const SizedBox();

  CommunityModel _communityModel = const CommunityModel();
  List<CommunityPostModel> _listCommunityPost = [];

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
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomePageBloc(),
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) => _handleState(state, context),
          builder: (context, state) {
            return BlocBuilder<MyAppBloc, MyAppState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    CustomScrollView(
                      controller: _pageScrollController,
                      slivers: [
                        SliverStack(
                          children: [
                            SliverList.list(
                              children: [
                                _buildHeader(context),
                                context.sizedBox(height: 20),
                                CustomTitle(
                                  title: translate(context).today,
                                  horizontalPadding: 12,
                                ),
                                ListPostHomePage(
                                  listCommunityPost: _listCommunityPost,
                                ),
                                context.sizedBox(height: 10),
                                Center(
                                  child: CustomSeeAllButton(
                                    width: context.width / 1.5,
                                    onPressed: () =>
                                        context.go(RouterPath.searchPage),
                                  ),
                                ),
                                context.sizedBox(height: 30),
                                CustomTitle(
                                  title: translate(context).popularTopic,
                                  horizontalPadding: 12,
                                ),
                                context.sizedBox(height: 12),
                                const PolularPlantsButton(),
                                context.sizedBox(height: 50),
                              ],
                            ),
                            _isAppBarExist
                                ? AppBarHomePage(
                                    appBarTitle: _appBarTitle,
                                  )
                                : const SliverAppBar(
                                    leading: SizedBox(),
                                    backgroundColor: Colors.transparent,
                                  )
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
    );
  }

  void _handleState(HomePageState state, BuildContext context) {
    if (state is HomePageGetCommunityInfoSuccess) {
      _communityModel = state.communityModel;
    }
    if (state is HomePageAddFavoriteCommunityPostSuccess) {
      CustomSnakBar.showSnackbar(
        context: context,
        message: translate(context).addToFavoriteSuccess,
        backgroundColor: colorTheme.get2DDA93,
      );
    }
    if (state is HomePageRemoveFavoriteCommunityPostSuccess) {
      CustomSnakBar.showSnackbar(
        context: context,
        message: translate(context).removeFromFavoriteSuccess,
        backgroundColor: colorTheme.get2DDA93,
      );
    }
    if (state is HomePageGetCommunityPostListSuccess) {
      _listCommunityPost = state.listCommunityPost.reversed.toList();
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        const ImageBackground(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: context.padding(top: 60),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SearchBarButton(),
                  context.sizedBox(width: 24),
                  const NotificationButton(),
                ],
              ),
            ),
            const WeatherHomePage(),
            RowTopicButton(
              pageScrollController: _pageScrollController,
              onIndetifyPressed: () => _onIdentifyPressed(context: context),
              onCommunityPressed: () => _onCommunityPressed(context: context),
              onGalleryPressed: () => _onGalleryPressed(context: context),
            ),
          ],
        )
      ],
    );
  }

  void _handleOpacity(double offset) {
    if (offset >= 180 && !_isAppBarExist) {
      setState(() {
        _isAppBarExist = true;
      });
    } else if (offset < 180 && _isAppBarExist) {
      setState(() {
        _isAppBarExist = false;
      });
    }
  }

  void _handleVisibleZoomOutButton(double offset) {
    if (offset >= 235) {
      if (_appBarTitle !=
          ZoomOutButtonHomePage.scrollDown(_communityModel.number ?? 0, () {
            setState(() {
              _communityModel =
                  CommunityModel(number: _communityModel.number! + 1);
            });
          }, (communityPostModel) {
            setState(() {
              _listCommunityPost.insert(0, communityPostModel);
            });
          })) {
        _openScrollDownButton();
      }
    } else if (_pageScrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        offset < 255) {
      _openScrollUpButton();
    } else {
      if (_appBarTitle != const SizedBox()) {
        _closeZoomOutButton();
      }
    }
  }

  void _openScrollUpButton() {
    if (_appBarTitle !=
        ZoomOutButtonHomePage.scrollUp(_communityModel.number ?? 0, () {
          setState(() {
            _communityModel =
                CommunityModel(number: _communityModel.number! + 1);
          });
        }, (communityPostModel) {
          setState(() {
            _listCommunityPost.insert(0, communityPostModel);
          });
        })) {
      setState(() {
        _appBarTitle = ZoomOutButtonHomePage.scrollUp(
            _communityModel.number ?? 0, () {}, (communityPostModel) {
          setState(() {
            _listCommunityPost.insert(0, communityPostModel);
          });
        });
      });
    }
  }

  void _openScrollDownButton() {
    setState(() {
      _appBarTitle =
          ZoomOutButtonHomePage.scrollDown(_communityModel.number ?? 0, () {
        setState(() {
          _communityModel = CommunityModel(number: _communityModel.number! + 1);
        });
      }, (communityPostModel) {
        setState(() {
          _listCommunityPost.insert(0, communityPostModel);
        });
      });
    });
  }

  void _closeZoomOutButton() {
    setState(() {
      _appBarTitle = const SizedBox();
    });
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
      child: CreateCommunityPostModal(
        lengthOfCommunityList: _communityModel.number ?? 0,
        updateListCommunityPostModel: (CommunityPostModel communityPostModel) {
          setState(() {
            _listCommunityPost.insert(0, communityPostModel);
          });
        },
        updateLengthOfCommunityPost: () {
          setState(() {
            _communityModel =
                CommunityModel(number: _communityModel.number! + 1);
          });
        },
      ),
    );
    _changeTopic(topicSymbol: TopicSymbol.community, context: context);
  }

  void _onGalleryPressed({required BuildContext context}) {
    _showTopicModal(context: context, child: const ShakeAnimationPage());
    _changeTopic(topicSymbol: TopicSymbol.relax, context: context);
  }

  void _showTopicModal({required BuildContext context, required Widget child}) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.85,
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

  @override
  void dispose() {
    _pageScrollController.dispose();
    super.dispose();
  }
}
