import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class SearchBar extends StatefulWidget {
  static const routeName = "search";
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _serchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        centerTitle: false,
        title: TextField(
          controller: _serchTextController,
          style: TextStyle(),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'search...',
              suffix: _serchTextController.text.isNotEmpty
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.photo),
                        Icon(Icons.photo),
                      ],
                    )
                  : Icon(
                      Icons.close,
                      color: kText1Color,
                    )),
        ),
      ),
    );
  }
}
