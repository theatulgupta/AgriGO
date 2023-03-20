import 'package:agri_go/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectWidget extends StatelessWidget {
  const SelectWidget({Key? key, required this.title, required this.iconPath})
      : super(key: key);
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath)
            .p16()
            .box
            .customRounded(BorderRadius.circular(10))
            .size(57, 57)
            .color(buttonGreen)
            .make(),
        13.widthBox,
      ],
    );
  }
}
