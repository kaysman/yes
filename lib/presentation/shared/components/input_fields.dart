import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/helpers.dart';

class LabeledInput extends StatelessWidget {
  const LabeledInput({
    Key? key,
    this.controller,
    this.label,
    this.validator,
    this.editMode = false,
    this.hintText,
    this.onChanged,
    this.initialValue,
    this.contentPadding,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;
  final bool editMode;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hintText != null) ...[
          Text(
            hintText ?? '-',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: kGrey1Color,
                ),
          ),
          SizedBox(height: 5),
        ],
        TextFormField(
          controller: controller,
          validator: validator,
          onChanged: this.onChanged,
          decoration: InputDecoration(
            // hintText: hintText,
            // hintStyle: Theme.of(context)
            //     .textTheme
            //     .subtitle1
            //     ?.copyWith(color: kGrey2Color),
            labelText: label,
            labelStyle: Theme.of(context).textTheme.subtitle1,
            contentPadding: contentPadding,
            enabled: editMode,
            disabledBorder: kDisabledInputBorder,
            focusedErrorBorder: kErrorInputBorder,
            errorBorder: kErrorInputBorder,
            focusedBorder: kFocusedInputBorder,
            enabledBorder: kEnabledInputBorder,
          ),
        ),
      ],
    );
  }
}
