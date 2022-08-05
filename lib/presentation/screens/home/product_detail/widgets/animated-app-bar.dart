
import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/app_bar_icon_btn.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/detail-icons.dart';
import 'package:yes/presentation/shared/colors.dart';

class AnimatedAppBar extends StatefulWidget with PreferredSizeWidget {
  AnimatedAppBar({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 60);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  bool isAppbarCollapsing = false;
  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void _initializeController() {
    widget.controller.addListener(() {
      if (widget.controller.offset == 0.0 &&
          !widget.controller.position.outOfRange) {
        if (!mounted) return;
        setState(() => isAppbarCollapsing = false);
      }
      if (widget.controller.offset >= 0.1 &&
          !widget.controller.position.outOfRange) {
        if (!mounted) return;
        setState(() => isAppbarCollapsing = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: isAppbarCollapsing
          ? kWhite.withOpacity(
              widget.controller.offset * .003 < 1
                  ? widget.controller.offset * .003
                  : 1,
            )
          : Colors.transparent,
      elevation: 0,
      leading: buildBackBtn(),
      actions: [
        ProductDetailIcons(
          onBagTap: () {},
          onFavoriteTap: () {},
          onShareTap: () {},
        ),
      ],
    );
  }

  buildBackBtn() {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      child: AppBarIconBtn(
        icon: Icons.arrow_back,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
