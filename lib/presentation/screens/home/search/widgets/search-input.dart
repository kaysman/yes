import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
    required this.searchTextController,
    required this.onSearchChanged,
    this.contentPadding,
  }) : super(key: key);
  final TextEditingController searchTextController;
  final ValueChanged<String?> onSearchChanged;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      style: TextStyle(),
      onChanged: onSearchChanged,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Haryt gözle',
        contentPadding: contentPadding,
      ),
    );
  }
}
