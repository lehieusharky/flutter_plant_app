import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/home_page/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home_page/sections/header/header_home_page.dart';
import 'package:plant_market/src/features/home_page/widgets/row_topic_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  var _isChoosed = 1;
  @override
  Widget build(BuildContext context) {
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
              body: Column(
                children: [
                  HeaderHomePage(searchController: _searchController),
                  context.sizedBox(height: 35),
                  RowTopicButton(isChoosed: _isChoosed),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
