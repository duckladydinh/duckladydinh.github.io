import 'package:flutter/material.dart';

class AnnotatedDivider extends StatelessWidget {
  final String text;
  final double thickness;
  final double textPadding;

  AnnotatedDivider(this.text, {this.thickness = 1.0, this.textPadding = 15.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: thickness,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(textPadding),
          child: Text(
            this.text,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
