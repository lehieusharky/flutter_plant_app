part of 'part_user_page.dart';

class UserPage extends BaseWidget {
  const UserPage({super.key});

  @override
  BaseWidgetState createState() => _UserPageState();
}

class _UserPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  late final TabController _tabController;

  final _nestedController = FixedExtentScrollController();
  double _zoomOutCreateTimelineButtonOpacity = 0;
  double _appbarBackgroundOpacity = 0;
  Color? _colorLeadingAppBar;
  List<TimeLineModel> _listTimeLineModel = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _nestedController.addListener(() {
      double offset = _nestedController.offset;
      _setOpacityWhenScroll(offset: offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (super.isNotLoggedIn()) {
      return const UserPageNotLoggedIn();
    } else {
      return Scaffold(
        body: BlocProvider(
          create: (context) => UserBloc()
            ..add(UserGetListTimeLine(plantName: userInfo!.selectedPlantName)),
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserCreatePlantSuccess) {
                CustomSnakBar.showSnackbar(
                  context: context,
                  message: translate(context).createNewPlantSuccess,
                  backgroundColor: colorTheme.get2DDA93,
                );

                context
                    .read<UserBloc>()
                    .add(UserToggleSelectPlant(plantName: state.plantName));
              }

              if (state is UserToggleSelectPlantSuccess) {
                context
                    .read<UserBloc>()
                    .add(UserGetListTimeLine(plantName: state.plantName));
              }

              if (state is UserCreateTimeLineSuccess) {
                Logger().e('okeeeee');
              }
              
              if (state is UserGetListTimeLineSuccess) {
                _listTimeLineModel = state.listTimeLine;
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  // const BackGroundContainer(),
                  NestedScrollView(
                    controller: _nestedController,
                    headerSliverBuilder: (context, value) {
                      return [
                        _buildAppBar(),
                        _buildTabBar(),
                      ];
                    },
                    body: _buildTabBarView(),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }
  }

  Widget _buildTabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        TimeLineSection(
          onPressed: () => _showCreatePostModal(context),
          listTimeLineModel: _listTimeLineModel,
        ),
        const ReminderSection(),
      ],
    );
  }

  Widget _buildTabBar() {
    return SliverToBoxAdapter(
      child: CustomTabBar(
        tabController: _tabController,
        tabs: [
          CustomTabChild(title: translate(context).timeLine),
          CustomTabChild(title: translate(context).reminder),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        return SliverAppBar(
          pinned: true,
          snap: true,
          leadingWidth: context.sizeWidth(80),
          floating: true,
          backgroundColor: Theme.of(context)
              .scaffoldBackgroundColor
              .withOpacity(_appbarBackgroundOpacity),
          expandedHeight: 90,
          leading: LeafPlusButton(color: _colorLeadingAppBar),
          flexibleSpace: FlexibleSpaceBar(
            title: PlantName(plantName: userInfo!.selectedPlantName),
          ),
          actions: [
            ZoomOutButton(
              opacity: _zoomOutCreateTimelineButtonOpacity,
              onPressed: () => _showCreatePostModal(context),
              iconPath: imageConstant.cameraSVG,
            ),
          ],
        );
      },
    );
  }

  void _showCreatePostModal(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.9,
      child: CreateTimelineModal(
        updateTimeLine: (TimeLineModel timeLineModel) =>
            _updateTimeLine(timeLineModel),
      ),
    );
  }

  void _setOpacityWhenScroll({required double offset}) {
    setState(() {
      _zoomOutCreateTimelineButtonOpacity = (offset / 200).clamp(0.0, 1.0);

      _appbarBackgroundOpacity = offset.clamp(0.0, 1.0);

      _setColorLeadingAppBar(offset: offset);
    });
  }

  void _setColorLeadingAppBar({required double offset}) {
    double triggerOffset = 50.0;
    if (offset > triggerOffset) {
      _colorLeadingAppBar = colorTheme.get2DDA93;
    } else {
      _colorLeadingAppBar = theme(context).textTheme.titleMedium!.color!;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateTimeLine(TimeLineModel timeLineModel) {
    setState(() {
      _listTimeLineModel.add(timeLineModel);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
