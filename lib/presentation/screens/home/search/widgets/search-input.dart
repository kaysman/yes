import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {Key? key,
      required this.serchTextController,
      required this.onSearchChanged,
      required this.onSearch,
      required this.onChangedTextIsNotEmty})
      : super(key: key);
  final TextEditingController serchTextController;
  final ValueChanged<String?> onSearchChanged;
  final VoidCallback onSearch;
  final bool onChangedTextIsNotEmty;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: serchTextController,
      style: TextStyle(),
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Haryt gözle',
        contentPadding:
            onChangedTextIsNotEmty ? const EdgeInsets.only(bottom: 14) : null,
        suffix: onChangedTextIsNotEmty
            ? Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onSearch,
                      icon: Icon(
                        Icons.search,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        serchTextController.clear();
                      },
                      icon: Icon(
                        Icons.close,
                        color: kText1Color,
                      ),
                    )
                  ],
                ),
              )
            : null,
      ),
    );
    ;
  }
}
