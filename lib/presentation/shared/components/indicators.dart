import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class ProgressIndicatorSmall extends StatelessWidget {
  final Color color;

  const ProgressIndicatorSmall({
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 15,
        width: 15,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 2,
        ),
      ),
    );
  }
}

class StatusIndicator extends StatelessWidget {
  final bool isBold;
  final Color color;
  final String? label;
  const StatusIndicator(
      {Key? key, this.isBold = false, this.color = kPrimaryColor, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        SizedBox(width: 8),
        Text(
          "$label",
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
