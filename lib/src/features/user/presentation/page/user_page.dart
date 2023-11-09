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
  Color? _colorLeadingAppBar;
  List<TimeLineModel> _listTimeLineModel = [];
  bool _showSectionButton = false;

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
              _handleState(state, context);
            },
            builder: (context, state) {
              return NestedScrollView(
                controller: _nestedController,
                headerSliverBuilder: (context, value) {
                  return [
                    _buildAppBar(),
                    // _buildTabBar(),
                    SliverStack(children: [
                      _showSectionButton
                          ? SliverList.list(
                              children: [
                                context.sizedBox(height: 20),
                                SectionTopicButton(
                                  icon: imageConstant.timeLineSvg,
                                  title: 'Time Line',
                                ),
                                context.sizedBox(height: 8),
                                SectionTopicButton(
                                  icon: imageConstant.reminderSvg,
                                  title: 'Reminder',
                                ),
                                context.sizedBox(height: 8),
                                SectionTopicButton(
                                  icon: imageConstant.chartSvg,
                                  title: 'Graph',
                                ),
                              ]
                                  .animate(interval: 60.ms)
                                  .fade(duration: 300.ms)
                                  .slide(duration: 400.ms),
                            )
                          : const SliverToBoxAdapter(
                              child: SizedBox(),
                            )
                    ]),
                  ];
                },
                body: _buildTabBarView(),
              );
            },
          ),
        ),
      );
    }
  }

  void _handleState(UserState state, BuildContext context) {
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

    if (state is UserGetListTimeLineSuccess) {
      _listTimeLineModel = state.listTimeLine;
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
    return AppBarUserPage(
      colorLeadingAppBar: _colorLeadingAppBar,
      zoomOutCreateTimelineButtonOpacity: _zoomOutCreateTimelineButtonOpacity,
      updateTimeLine: (timeLineModel) => _updateTimeLine(timeLineModel),
      listTimeLineIsEmpty: _listTimeLineModel.isEmpty,
      backgroundImage: _listTimeLineModel.isNotEmpty
          ? _listTimeLineModel.reversed.toList()[0].image
          : '',
      lengthOfListTimeLine: _listTimeLineModel.length,
      onLeadingPressed: () {
        setState(() {
          _showSectionButton = !_showSectionButton;
        });
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
        currentLengthOfListTimeLine: _listTimeLineModel.length,
      ),
    );
  }

  void _setOpacityWhenScroll({required double offset}) {
    setState(() {
      _zoomOutCreateTimelineButtonOpacity = (offset / 200).clamp(0.0, 1.0);

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
