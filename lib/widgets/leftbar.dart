
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LeftBar extends StatelessWidget {
  final double barwidth;
  const LeftBar({Key? key, required this.barwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width:barwidth,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            color: accentHexColor,
          ),
        )
      ],
    );
  }
}
