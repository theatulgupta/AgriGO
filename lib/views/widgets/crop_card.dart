import 'package:agri_go/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CropCard extends StatelessWidget {
  const CropCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return VxCard(Column(
      children: [
        Image.asset(
          "assets/images/wheat.png",
          height: 196,
          fit: BoxFit.cover,
        ).pOnly(top: 10).px12(),
        title.text
            .size(20)
            .bold
            .color(myGreen)
            .makeCentered()
            .pOnly(top: 14, bottom: 18)
      ],
    )).p0.customRounded(BorderRadius.circular(35)).make().pOnly(left: 25);
  }
}
