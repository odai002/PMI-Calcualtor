import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class MainContainer extends StatelessWidget {
  final Widget child;
  MainContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          color: kSecondaryColor,
        ),
        child: child);
  }
}
