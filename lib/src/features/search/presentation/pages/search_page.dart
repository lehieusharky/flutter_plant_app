import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_search_bar.dart';
import 'package:plant_market/src/features/search/presentation/widgets/list_search_result.dart';

class SearchPage extends BaseWidget {
  const SearchPage({super.key});

  @override
  BaseWidgetState createState() => _SearchPageState();
}

class _SearchPageState extends BaseWidgetState {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Stack(
        children: [
          const CustomBackButton(),
          Column(
            children: [
              context.sizedBox(height: 60),
              CustomSearchBar(
                searchController: _searchController,
                hintText: 'Tim kiem cac bai viet cong dong',
              ),
              const Expanded(
                child: ListSearchResult(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
