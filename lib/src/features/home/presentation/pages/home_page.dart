import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_see_all_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/header_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/popular_topic_button.dart';
import 'package:plant_market/src/features/home/presentation/widgets/list_post_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/search_bar_button.dart';
import 'package:plant_market/src/features/home/presentation/widgets/shake_animation_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/row_topic_button.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomePageBloc(),
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageDeterminePositionSuccess) {
              context.read<HomePageBloc>().add(HomePageGetWeatherInfomation(
                  lat: state.position!.latitude.toString(),
                  lon: state.position!.longitude.toString()));
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
                            const HeaderHomePage(),
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

  @override
  bool get wantKeepAlive => true;
}
