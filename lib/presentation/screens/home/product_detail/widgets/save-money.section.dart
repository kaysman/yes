import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class SaveMoneySection extends StatelessWidget {
  const SaveMoneySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Buy it for ',
                    style: TextStyle(
                        color: kText1Color,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    children: [
                      // * keep it Db
                      TextSpan(
                        text: '${200 - 0.0}TMT',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12,
                            ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Save 300TMT',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Color.fromARGB(255, 40, 110, 83),
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Use at checkout',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 12,
                  ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'Orders above Rs.1999 (only on first purchase)',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'View Products',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12,
                              color: kPrimaryColor,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
          ]),
          Container(
            width: double.infinity,
            child: Divider(
              color: Colors.grey[300],
              height: 1,
              thickness: .5,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            color: kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Emi option available',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 12,
                          ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'View Plan',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: kPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Emi starting from 90TMT/month',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
