import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData iconType;
  IconContent({this.label, this.iconType});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconType,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}