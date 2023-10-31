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
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => HomePageBloc(),
          child: BlocConsumer<HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is HomePageGetCommunityInfoSuccess) {
                _communityModel = state.communityModel;
              }
              if (state is HomePageAddFavoriteCommunityPostSuccess) {
                CustomSnakBar.showSnackbar(
                  context: context,
                  message: 'Add to favorite success',
                  backgroundColor: colorTheme.get2DDA93,
                );
              }
              if (state is HomePageRemoveFavoriteCommunityPostSuccess) {
                CustomSnakBar.showSnackbar(
                  context: context,
                  message: 'Remove from favorite success',
                  backgroundColor: colorTheme.get2DDA93,
                );
              }
              if (state is HomePageGetCommunityPostListSuccess) {
                _listCommunityPost = state.listCommunityPost.reversed.toList();
              }
            },
            builder: (context, state) {
              return BlocBuilder<MyAppBloc, MyAppState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      // const BackGroundContainer(),
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
                                  ListPostHomePage(
                                    listCommunityPost: _listCommunityPost,
                                  ),
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
      ),
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
    if (offset >= 255) {
      if (_appBarTitle !=
          ZoomOutButtonHomePage.scrollDown(_communityModel.number ?? 0,
              (communityPostModel) {
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
        ZoomOutButtonHomePage.scrollUp(_communityModel.number ?? 0,
            (communityPostModel) {
          setState(() {
            _listCommunityPost.insert(0, communityPostModel);
          });
        })) {
      setState(() {
        _appBarTitle = ZoomOutButtonHomePage.scrollUp(
            _communityModel.number ?? 0, (communityPostModel) {
          setState(() {
            _listCommunityPost.insert(0, communityPostModel);
          });
        });
      });
    }
  }

  void _openScrollDownButton() {
    setState(() {
      _appBarTitle = ZoomOutButtonHomePage.scrollDown(
          _communityModel.number ?? 0, (communityPostModel) {
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
      ),
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

  @override
  void dispose() {
    _pageScrollController.dispose();
    super.dispose();
  }
}
