import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/home_screen.dart';
import 'package:yes/presentation/screens/home/search/serach.dart';
import 'package:yes/presentation/screens/home/search/widgets/search-input.dart';
import 'package:yes/presentation/shared/components/buttons.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key, this.title, this.isSearchOnHome, this.onSearch})
      : super(key: key);
  final String? title;
  final bool? isSearchOnHome;
  final ValueChanged<String>? onSearch;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 56);
}

class _HomeAppBarState extends State<HomeAppBar> {
  TextEditingController searchTextController = TextEditingController();
  String? onSearchChangedText;
  bool isSearch = false;
  Widget? _title;
  Icon _searchIcon = Icon(
    CupertinoIcons.search,
  );
  Widget _logo = Logo();

  @override
  void initState() {
    if (widget.title != null) {
      _title = Text(widget.title ?? '-');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .5,
      leadingWidth: 20,
      title: widget.title != null ? _title : _logo,
      actions: _buildActions(),
    );
  }

  List<Widget>? _buildActions() {
    return [
      IconButton(
        onPressed: _searchPressed,
        icon: _searchIcon,
      ),
      // TODO: use for animation => AnimatedCrosssFade()
      if (isSearch)
        IconButton(
          onPressed: _clearPressed,
          icon: Icon(
            Icons.close,
          ),
        ),
      if (!isSearch) ...[
        FavoriteButton(),
        CartButton(),
      ],
    ];
  }

  _searchPressed() {
    if (widget.isSearchOnHome == true) {
      Navigator.of(context).pushNamed(SearchBar.routeName);
    } else {
      setState(() {
        isSearch = true;
        this._title = SearchInput(
          searchTextController: searchTextController,
          onSearchChanged: (v) {
            onSearchChangedText = v;
          },
        );
      });
      if (onSearchChangedText != null) {
        widget.onSearch?.call(onSearchChangedText!);
      }
    }
  }

  _clearPressed() {
    setState(() {
      onSearchChangedText = '';
      searchTextController.text = '';
    });
  }
}
