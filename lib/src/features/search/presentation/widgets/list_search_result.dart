import 'package:flutter/material.dart';
import 'package:plant_market/src/features/search/presentation/widgets/search_item.dart';

class ListSearchResult extends StatelessWidget {
  const ListSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const SearchItem();
      },
    );
  }
}
