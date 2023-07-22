import 'package:flutter/material.dart';

class BoxColumn extends StatelessWidget {
  final String textDescription;
  final Color boxColor;
  const BoxColumn(
      {super.key, required this.textDescription, required this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            color: boxColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(textDescription)
      ],
    );
  }
}
