import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/data/service/products_service.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/animated-app-bar.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/fit-section.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/loading.widget.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/price-and-description.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/quality-section.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/save-money.section.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/select-sizes-section.dart';
import 'package:yes/presentation/shared/colors.dart';
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
    return Scaffold(
      // backgroundColor: kWhite,
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
  late CartBloc cartBloc;
  SizeEntity? selectedSize;

  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

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
              images: widget.product.images,
            ),

          ProductPriceAndDescription(
            brand: widget.product.brand?.name ?? '-',
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
          SelectSizesSection(
            product: widget.product,
            // sizes: widget.product.sizes ?? [],
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
}
