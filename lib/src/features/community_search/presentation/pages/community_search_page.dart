import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_search_bar.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/community_search/presentation/bloc/community_search_bloc.dart';
import 'package:plant_market/src/features/community_search/presentation/widgets/list_search_result.dart';

class CommunitySearchPage extends BaseWidget {
  const CommunitySearchPage({super.key});

  @override
  BaseWidgetState createState() => _SearchPageState();
}

class _SearchPageState extends BaseWidgetState {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocProvider(
        create: (context) => CommunitySearchBloc()
          ..add(CommunitySearchGetListResult(
              getListCommunitySearchResultParam:
                  GetListCommunitySearchResultParam(limit: 10))),
        child: Stack(
          children: [
            const CustomBackButton(),
            Column(
              children: [
                context.sizedBox(height: 60),
                CustomSearchbar(
                  controller: _searchController,
                  hintText: 'Tim kiem cac bai viet cong dong',
                ),
                const Expanded(
                  child: ListCommunitySearchResult(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
