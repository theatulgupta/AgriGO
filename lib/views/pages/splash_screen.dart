import 'package:agri_go/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/bg_image.png", fit: BoxFit.cover),
          VxBox().color(myGreen).makeCentered().opacity(value: 0.80),
          Center(
              child: "Your Crop\nYour Choice"
                  .text
                  .center
                  .size(40)
                  .extraBold
                  .fontWeight(FontWeight.w800)
                  .white
                  .bold
                  .makeCentered())
        ],
      ),
    );
  }
}
