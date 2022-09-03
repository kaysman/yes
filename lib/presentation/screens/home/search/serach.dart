import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/enums/gadget-type.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/service/products_service.dart';
import 'package:yes/presentation/blocs/gadget_bloc.dart';
import 'package:yes/presentation/screens/home/products/products_screen.dart';
import 'package:yes/presentation/screens/home/products/widgets/emty-search-or-filter.dart';
import 'package:yes/presentation/screens/home/search/widgets/search-input.dart';
import 'package:yes/presentation/screens/home/widgets/views.dart';
import 'package:yes/presentation/shared/components/buttons.dart';
import 'widgets/suggest-list.dart';

class SearchBar extends StatefulWidget {
  static const routeName = "search";
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchTextController = TextEditingController();
  String searchText = '';
  String onChangedText = '';
  late Future<List<ProductEntity>>? getAllProducts;
  List<ProductEntity> products = [];

  List<ProductEntity> suggestionList = [];
  @override
  void initState() {
    getAllProducts = ProductsService.getProducts();
    getAllProducts?.then((value) => products = value);
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(products);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        centerTitle: false,
        elevation: 0.6,
        actions: _buildAppBarActions(),
        title: _buildTitle(),
      ),
      body: _buildBody(),
    );
  }

  _buildAppBarActions() {
    return onChangedText.isNotEmpty
        ? [
            SearchButton(
              onSearch: () {
                setState(() {
                  searchText = onChangedText;
                });
              },
            ),
            ClearButton(
              onClear: () {
                _searchTextController.text = '';
                searchText = '';
                setState(() {});
              },
            ),
          ]
        : null;
  }

  _buildTitle() {
    return SearchInput(
      onSearchChanged: (v) {
        setState(() {
          onChangedText = v!;
          suggestionList =
              products.where((el) => el.name_tm?.contains(v) == true).toList();
          if (v.isEmpty) {
            searchText = '';
          }
        });
      },
      searchTextController: _searchTextController,
    );
  }

  _buildBody() {
   return _searchTextController.text.isEmpty
        ? BlocBuilder<GadgetBloc, GadgetState>(
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
        : _searchTextController.text.isNotEmpty && searchText.isEmpty
            ? SuggestionList(
                onTap: (v) {
                  setState(() {
                    onChangedText = v;
                    _searchTextController.text = v;
                    searchText = v;
                  });
                },
                suggestionList: suggestionList,
              )
            : searchText.isNotEmpty
                ? ProductsScreen(searchValue: searchText)
                : SizedBox();
  }
}
