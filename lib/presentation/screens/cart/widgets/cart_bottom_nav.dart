import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/order/create-order-item.model.dart';
import 'package:yes/data/models/order/create-order.model.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/blocs/auth_bloc.dart';
import 'package:yes/presentation/screens/cart/blocs/order.bloc.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/screens/cart/widgets/user_adress.dart';
import 'package:yes/presentation/screens/profile/profile_screen.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/buttons.dart';
import 'package:yes/presentation/shared/components/input_fields.dart';
import 'package:yes/presentation/shared/helpers.dart';
import 'package:yes/presentation/shared/validators.dart';

import '../cart_screen.dart';

class CartBottomNav extends StatefulWidget {
  const CartBottomNav({Key? key}) : super(key: key);

  @override
  State<CartBottomNav> createState() => _CartBottomNavState();
}

class _CartBottomNavState extends State<CartBottomNav> {
  late OrderBloc orderBloc;
  late String? currentUser;

  @override
  void initState() {
    currentUser = AppService.currentUser.value;
    orderBloc = BlocProvider.of<OrderBloc>(context);
    super.initState();
  }

  String? note;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listenWhen: (p, c) => p.createOrderStatus != c.createOrderStatus,
      listener: (context, state) {
        if (state.createOrderStatus == CreateOrderStatus.success) {
          showSnackBar(
            context,
            Text('Sargydynyz ustunlikli yerne yetirildi'),
            type: SnackbarType.success,
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: double.infinity,
          height: 60,
          child: Container(
            width: double.infinity,
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return Button(
                  text: 'Satyn al',
                  primary: kPrimaryColor,
                  textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 16,
                        color: kWhite,
                      ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  textColor: kWhite,
                  onPressed: () {
                    if (authState.status == AuthStatus.Authenticated ||
                        currentUser != null) {
                      showAppBottomSheet(
                        context,
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, cartState) {
                            return buildOrderSheet(
                              context,
                              () async {
                                var orderProducts = cartState.cartItems
                                    .map(
                                      (e) => CreateOrderItem(
                                        productId: e.id!,
                                        quantity: e.defQuantity,
                                        size_id: e.selectedSize!.id!,
                                      ),
                                    )
                                    .toList();

                                CreateOrderDTO data = CreateOrderDTO(
                                  products: orderProducts,
                                  userId: 1,
                                  addressId: 2,
                                  note: note,
                                );
                                await orderBloc.createOrder(data);
                              },
                              (v) {
                                setState(() {
                                  note = v;
                                });
                              },
                              state.createOrderStatus ==
                                  CreateOrderStatus.loading,
                            );
                          },
                        ),
                      );
                    } else if (authState.status != AuthStatus.Authenticated ||
                        currentUser == null) {
                      showLoginBottomSheet(context);
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  buildOrderSheet(
    BuildContext context,
    VoidCallback onOrder,
    ValueChanged<String?> onNoteCahnged,
    bool orderLoading,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SheetHeader(title: 'Sargyda bellik ýazp bilersiňiz'),
            SizedBox(
              height: 14,
            ),
            LabeledInput(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 24,
              ),
              editMode: true,
              label: 'Bellik',
              onChanged: onNoteCahnged,
              validator: emtyField,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Button(
                text: 'Sargyt et',
                isLoading: orderLoading,
                primary: kPrimaryColor,
                textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 16,
                      color: kWhite,
                    ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                onPressed: onOrder,
              ),
            )
          ],
        ),
      ),
    );
  }
}
