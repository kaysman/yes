import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/order/create-order.model.dart';
import 'package:yes/presentation/screens/cart/cart.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/button.dart';
import 'package:yes/presentation/shared/components/input_fields.dart';
import 'package:yes/presentation/shared/helpers.dart';
import 'package:yes/presentation/shared/validators.dart';

import '../cart_screen.dart';

class CartBottomNav extends StatelessWidget {
  const CartBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 80,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                color: Color.fromARGB(255, 255, 234, 240),
                child: Text(
                  '1 Item selected for order',
                  style: TextStyleUtils().smallboldText,
                ),
              ),
              Container(
                width: double.infinity,
                child: Button(
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
                    showAppBottomSheet(
                      context,
                      buildOrderSheet(
                        context,
                        () {
                          CreateOrderDTO data = CreateOrderDTO(
                            products: [
                              // CreateOrderItem(
                              //   productId: 1,
                              //   quantity: 10,
                              //   size_id: 2,
                              // ),
                            ],
                            userId: 1,
                            addressId: 2,
                          );
                        },
                        false,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  buildOrderSheet(
    BuildContext context,
    VoidCallback onOrder,
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
            LabeledInput(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 24,
              ),
              editMode: true,
              hintText: 'Bellik :',
              onChanged: (v) {},
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
