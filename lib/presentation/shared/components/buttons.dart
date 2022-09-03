import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/cart/widgets/wishlist/bloc/wishList.bloc.dart';
import 'package:yes/presentation/screens/cart/widgets/wishlist/wish_grid_list.dart';
import 'package:yes/presentation/screens/home/home_screen.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/indicators.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    this.primary = kWhite,
    this.borderColor = kGrey1Color,
    this.borderRadius = 6.0,
    this.hasBorder = false,
    this.textColor,
    this.textStyle,
    this.onPressed,
    this.elevation,
    this.padding,
    this.onPrimary,
    this.isDisabled = false,
    this.isLoading = false,
    this.icon,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color primary;
  final Color? onPrimary;
  final bool hasBorder;
  final Color borderColor;
  final double borderRadius;
  final double? elevation;
  final EdgeInsets? padding;
  final bool isLoading;
  final bool isDisabled;
  final Widget? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1,
        child: AbsorbPointer(
          absorbing: isDisabled || isLoading,
          child: ElevatedButton(
            onPressed: this.onPressed,
            style: ElevatedButton.styleFrom(
              elevation: this.elevation,
              primary: this.primary,
              onPrimary: this.onPrimary,
              shape: RoundedRectangleBorder(
                side: this.hasBorder
                    ? BorderSide(color: this.borderColor)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(this.borderRadius),
              ),
              padding: this.padding,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) icon!,
                SizedBox(width: 8.0),
                Text(
                  this.text,
                  style: textStyle ??
                      Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: textColor),
                ),
                SizedBox(width: 8.0),
                if (isLoading)
                  ProgressIndicatorSmall(
                    color: textColor ?? kWhite,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FlatBackButton<T> extends StatelessWidget {
  const FlatBackButton({
    Key? key,
    this.result,
  }) : super(key: key);

  final T? result;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        Navigator.of(context).pop(result);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // AppIcons.svgAsset(
          //   AppIcons.back_android,
          //   color: kGrey1Color,
          //   height: 18,
          //   width: 18,
          // ),
          SizedBox(
            width: 8,
          ),
          Text(
            "Back",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: kGrey1Color),
          ),
        ],
      ),
    );
  }
}

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    Key? key,
    required this.tryAgain,
  }) : super(key: key);

  final VoidCallback tryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, size: 42, color: Colors.redAccent),
          SizedBox(height: 14),
          Text(
            "Something went wrong",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 8),
          TextButton.icon(
            onPressed: this.tryAgain,
            icon: Icon(Icons.refresh),
            label: Text(
              "Try again",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}

class SmallCircleButton extends StatelessWidget {
  const SmallCircleButton({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'shopping-bag');
          },
          icon: Icon(
            CupertinoIcons.bag,
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.cartItems.length > 0
                ? Positioned(
                    top: 10,
                    right: 6,
                    child: ProductCountIndicator(
                      state: state,
                    ),
                  )
                : SizedBox.shrink();
          },
        )
      ],
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              WishGridList.routeName,
              arguments: {
                'products': state.wishListItems,
                'categories': state.categories,
                'filteredList': state.filteredList,
              },
            );
          },
          icon: Icon(
            CupertinoIcons.heart,
          ),
        );
      },
    );
    ;
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key, required this.onSearch}) : super(key: key);
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onSearch,
      icon: Icon(
        CupertinoIcons.search,
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    Key? key,
    required this.onClear,
  }) : super(key: key);
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClear,
      icon: Icon(
        CupertinoIcons.clear,
        color: kText1Color,
        size: 18,
      ),
    );
  }
}
