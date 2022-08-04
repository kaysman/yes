import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/service/products_service.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/fit-section.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/loading.widget.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/price-and-description.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/quality-section.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/save-money.section.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/select-sizes-section.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'widgets/app_bar_icon_btn.dart';
import 'widgets/carusel-image.dart';
import 'widgets/product_detail_bootm_nav.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "product-detail";
  final ProductEntity product;
  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future<ProductEntity?> fetchProduct;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    if (widget.product.id != null) {
      fetchProduct = ProductsService.getProductById(widget.product.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ProductDetailBottomNavBar(product: widget.product),
        extendBodyBehindAppBar: true,
        appBar: AnimatedAppBar(
          controller: controller,
        ),
        body: FutureBuilder<ProductEntity?>(
          future: fetchProduct,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ProductDetailScreenLoading(product: widget.product);
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return ProductDetailResponse(
                product: snapshot.data!,
                controller: controller,
              );
            } else {
              return Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(color: kPrimaryColor),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ProductDetailIcons extends StatelessWidget {
  const ProductDetailIcons({
    Key? key,
    required this.onShareTap,
    required this.onFavoriteTap,
    required this.onBagTap,
  }) : super(key: key);

  final VoidCallback onShareTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onBagTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        children: [
          AppBarIconBtn(icon: Icons.share, onPressed: () {}),
          SizedBox(
            width: 10,
          ),
          AppBarIconBtn(icon: Icons.favorite_outline, onPressed: () {}),
          SizedBox(
            width: 10,
          ),
          AppBarIconBtn(icon: Icons.shopping_bag_outlined, onPressed: () {}),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class ProductDetailResponse extends StatefulWidget {
  ProductDetailResponse(
      {Key? key, required this.product, required this.controller})
      : super(key: key);
  final ProductEntity product;
  final ScrollController controller;

  @override
  State<ProductDetailResponse> createState() => _ProductDetailResponseState();
}

class _ProductDetailResponseState extends State<ProductDetailResponse> {
  // ScrollController controller = ScrollController();
  late CartBloc cartBloc;

  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      primary: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.product.images != null)
            CaruselProductImages(
              onPageCahnge: (v) {
                setState(() {
                  activePage = v;
                });
              },
              images: widget.product.images,
            ),
          if (widget.product.images != null)
            Container(
              color: kWhite,
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.product.images!.length,
                  (index) => buildIndicator(index),
                ),
              ),
            ),
          ProductPriceAndDescription(
            description: widget.product.description_tm ?? '-',
            name: widget.product.name_tm ?? '-',
            ourPrice: widget.product.ourPrice ?? 0,
          ),
          SizedBox(height: 15),
          // * SaveMoneyWidget
          SaveMoneySection(),
          // * Size Box
          SizedBox(
            height: 15,
          ),
          BlocConsumer<CartBloc, CartState>(
            listenWhen: (p, c) => p.selectedSize != c.selectedSize,
            listener: (context, state) {},
            builder: (context, state) {
              return SelectSizesSection(
                onSizeSelected: (v) {
                  cartBloc.toSetSize(v);
                },
                sizes: widget.product.sizes ?? [],
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          // * Fit etc..
          Fitsection(),
          // * Quality part
          SizedBox(
            height: 15,
          ),
          QualitySection()
        ],
      ),
    );
  }

  buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: activePage == index ? Colors.pinkAccent : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

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
