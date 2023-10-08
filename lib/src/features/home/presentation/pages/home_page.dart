import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/header_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/posts_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/shake_animation.dart';
import 'package:plant_market/src/features/home/presentation/widgets/row_topic_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _searchController = TextEditingController();

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
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderHomePage(searchController: _searchController),
                    context.sizedBox(height: 40),
                    const RowTopicButton(),
                    const SharkeAnimationHomePage(),
                    // context.sizedBox(height: 20),
                    CustomTitle(title: translate(context).today),
                    context.sizedBox(height: 10),
                    const PostsHomePage(),
                    context.sizedBox(height: 50),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
