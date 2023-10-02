import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/features/home/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/sections/header/header_home_page.dart';
import 'package:plant_market/src/features/home/sections/posts/posts_home_page.dart';
import 'package:plant_market/src/features/home/sections/shake_animation/shake_animation.dart';
import 'package:plant_market/src/features/home/widgets/row_topic_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _searchController = TextEditingController();
  var _isChoosed = 1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomePageBloc(),
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageChangeTopicSuccess) {
              _isChoosed = state.isChoosed;
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderHomePage(searchController: _searchController),
                    context.sizedBox(height: 20),
                    RowTopicButton(isChoosed: _isChoosed),
                    const SharkeAnimationHomePage(),
                    context.sizedBox(height: 20),
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
