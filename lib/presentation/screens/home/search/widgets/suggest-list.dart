import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList(
      {Key? key, required this.suggestionList, required this.onTap})
      : super(key: key);
  final List<ProductEntity> suggestionList;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: kBlack,
      child: ListView(
        padding: const EdgeInsets.all(4),
        children: suggestionList
            .map(
              (e) => ListTile(
                leading: Icon(Icons.search),
                title: Text(e.name_tm ?? '-'),
                onTap: () => onTap.call(e.name_tm ?? ' '),
              ),
            )
            .toList(),
      ),
    );
  }
}
