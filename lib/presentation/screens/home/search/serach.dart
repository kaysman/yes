import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/screens/home/products/products_screen.dart';
import 'package:yes/presentation/screens/home/search/widgets/search-input.dart';
import 'package:yes/presentation/screens/home/widgets/views.dart';
import 'package:yes/presentation/shared/colors.dart';

class SearchBar extends StatefulWidget {
  static const routeName = "search";
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _serchTextController = TextEditingController();
  String searchText = '';
  String onChangedText = '';
  bool isMount = false;

  @override
  void initState() {
    isMount = true;
    super.initState();
  }

  @override
  void dispose() {
    isMount = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        centerTitle: false,
        elevation: 0.6,
        title: SearchInput(
          onChangedTextIsNotEmty: onChangedText.isNotEmpty,
          onSearch: () {
            setState(() {
              searchText = onChangedText;
            });
          },
          onSearchChanged: (v) {
            setState(() {
              onChangedText = v!;
            });
          },
          serchTextController: _serchTextController,
        ),
      ),
      body: isMount && searchText.isEmpty
          ? BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                var gadgets = state.gadgets
                    ?.where((el) =>
                        el.type ==
                        GadgetType
                            .TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT)
                    .toList();
                return gadgets != null
                    ? GadgetProductListView(gadget: gadgets.first)
                    : SizedBox();
              },
            )
          : isMount && searchText.isNotEmpty
              ? ProductsScreen(searchValue: searchText)
              : SizedBox(),
    );
  }
}
