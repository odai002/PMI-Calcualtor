import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final String title;
  final String number;
  final Function increment;
  final Function decrement;
  IncrementDecrementWidget(
      {required this.title,
      required this.number,
      required this.decrement,
      required this.increment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: kTitleTextStyle,
        ),
        Text(
          number,
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.3),
              radius: 25,
              child: IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () {
                  decrement();
                },
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.3),
              radius: 25,
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  increment();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
