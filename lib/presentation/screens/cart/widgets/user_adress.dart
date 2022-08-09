import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/adress/create-adress.model.dart';
import 'package:yes/data/models/client/client.model.dart';
import 'package:yes/presentation/screens/cart/blocs/adress.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/button.dart';
import 'package:yes/presentation/shared/components/input_fields.dart';
import 'package:yes/presentation/shared/helpers.dart';
import 'package:yes/presentation/shared/validators.dart';

import 'my_container.dart';

class UserAdress extends StatelessWidget {
  final Client? user;
  const UserAdress({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      pVertical: 5,
      pHorizontal: 15,
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                      text: 'Dostawka: ',
                      style: TextStyle(
                        color: kText1Color,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${user?.name ?? ' -'} ,  ${user?.phone ?? '-'}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${user?.address ?? '-'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kText1Color,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          //TODO: update adress or order?
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () {
                showAppBottomSheet(context, ChangeAdressOrAddnewAdressSheet());
              },
              child: Text(
                'ÜÝTGET',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChangeAdressOrAddnewAdressSheet extends StatelessWidget {
  const ChangeAdressOrAddnewAdressSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdressBloc, AdressState>(
      builder: (context, state) {
        return Container(
          color: kScaffoldBgColor,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SheetHeader(
                title: 'Adress barada',
              ),
              SizedBox(
                height: 14,
              ),
              if (state.adress == null)
                Center(
                  child: Text(
                    'Heniz goşulan adress ýok...',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          decoration: TextDecoration.underline,
                          color: kGrey2Color,
                        ),
                  ),
                ),
              if (state.adress != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(8)),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Indicator(),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                            flex: 4,
                            child: Text(
                                state.adress?.address.addressLine1 ?? '-')),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          flex: 2,
                          child: buildTitle(context, state.adress?.title),
                        )
                      ]),
                ),
              SizedBox(
                height: 14,
              ),
              SizedBox(
                width: double.infinity,
                child: Button(
                  hasBorder: true,
                  text: 'Adress goş'.toUpperCase(),
                  onPressed: () {
                    showAppBottomSheet(
                      context,
                      AdressCreateSheet(),
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

  buildTitle(BuildContext context, String? title) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.greenAccent,
        ),
      ),
      child: Text(
        title ?? '-',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kWhite,
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
          ),
        )
      ],
    );
  }
}

class AdressCreateSheet extends StatefulWidget {
  static const routeName = 'create-adress-sheet';
  AdressCreateSheet({Key? key}) : super(key: key);

  @override
  State<AdressCreateSheet> createState() => _AdressCreateSheetState();
}

class _AdressCreateSheetState extends State<AdressCreateSheet> {
  late AdressBloc adressBloc;
  TextEditingController adress1Controller = TextEditingController();
  TextEditingController adress2Controller = TextEditingController();
  TextEditingController titleController = TextEditingController();

  bool isDefault = false;

  @override
  void initState() {
    adressBloc = BlocProvider.of<AdressBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdressBloc, AdressState>(
      listenWhen: (p, c) => p.createAdressStatus != c.createAdressStatus,
      listener: (context, state) {
        if (state.createAdressStatus == CreateAdressStatus.success) {
          showSnackBar(
            context,
            Text('Adress üstünlikli döredildi'),
            type: SnackbarType.success,
          );
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SheetHeader(title: 'Täze adress goşmak'),
              SizedBox(
                height: 14,
              ),
              LabeledInput(
                editMode: true,
                hintText: 'Adress 1 *',
                controller: adress1Controller,
                validator: emtyField,
                contentPadding: const EdgeInsets.all(14),
              ),
              SizedBox(
                height: 14,
              ),
              LabeledInput(
                editMode: true,
                hintText: 'Adress 2',
                controller: adress2Controller,
                validator: emtyField,
                contentPadding: const EdgeInsets.all(14),
              ),
              SizedBox(
                height: 14,
              ),
              LabeledInput(
                contentPadding: const EdgeInsets.all(14),
                editMode: true,
                hintText: 'Ady',
                controller: titleController,
                validator: emtyField,
              ),
              SizedBox(
                height: 14,
              ),
              CheckboxListTile(
                selectedTileColor: kGrey3Color,
                selected: isDefault,
                tileColor: kGrey4Color,
                activeColor: kPrimaryColor,
                title: Text(
                  'Hemişelik',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                value: isDefault,
                onChanged: (v) {
                  setState(() {
                    isDefault = v!;
                  });
                },
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: double.infinity,
                child: Button(
                  primary: kPrimaryColor,
                  textColor: kWhite,
                  text: 'Täze adress goş'.toUpperCase(),
                  isLoading:
                      state.createAdressStatus == CreateAdressStatus.loading,
                  onPressed: () async {
                    CreateAddressDTO data = CreateAddressDTO(
                      isdefault: isDefault,
                      addressLine1: adress1Controller.text,
                      userId: 1,
                      addressLine2: adress2Controller.text,
                      title: titleController.text,
                    );
                    await adressBloc.createAdress(data);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
