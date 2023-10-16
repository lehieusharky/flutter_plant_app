part of 'part_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    Logger().w('is logged in home page: ${sharePreference.isLoggedIn()}');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomePageBloc(),
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageDeterminePositionSuccess) {
              _getWeatherInfomation(
                context: context,
                lat: state.position!.latitude.toString(),
                long: state.position!.longitude.toString(),
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<MyAppBloc, MyAppState>(
              builder: (context, state) {
                return Scaffold(
                  body: Stack(
                    children: [
                      const BackGroundContainer(),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const WeatherHomeage(),
                            context.sizedBox(height: 15),
                            Padding(
                                padding: context.padding(horizontal: 12),
                                child: const SearchBarButton()),
                            context.sizedBox(height: 15),
                            Padding(
                              padding: context.padding(horizontal: 12),
                              child: const RowTopicButton(),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _getWeatherInfomation(
      {required String lat,
      required String long,
      required BuildContext context}) {
    context
        .read<HomePageBloc>()
        .add(HomePageGetWeatherInfomation(lat: lat, long: long));
  }

  @override
  bool get wantKeepAlive => true;
}
