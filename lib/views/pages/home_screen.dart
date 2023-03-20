import 'package:agri_go/controller/data_controller.dart';
import 'package:agri_go/model/article_model.dart';
import 'package:agri_go/utils/constants.dart';
import 'package:agri_go/views/pages/filter_screen.dart';
import 'package:agri_go/views/widgets/crop_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final DataController controller = Get.put(DataController());

  var articles = [
    "Increase Wheat Production",
    "Increase Wheat Production",
    "Increase Wheat Production",
    "Increase Wheat Production",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      body: ListView(children: [
        VxCard(Column(children: [
          "Crop Prediction"
              .text
              .extraBold
              .size(40)
              .makeCentered()
              .pOnly(top: 40, bottom: 38),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.arrow_right,
                size: 30,
                color: Vx.white,
              )
                  .box
                  .square(57)
                  .color(myGreen)
                  .customRounded(BorderRadius.circular(10))
                  .make()
                  .pOnly(right: 15),
              VxBox(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Select State".text.bold.size(20).white.make(),
                  SvgPicture.asset("assets/svg/drop_down.svg"),
                  // 20.widthBox
                ],
              ).px24())
                  .height(57)
                  .width(240)
                  .color(myGreen)
                  .customRounded(BorderRadius.circular(10))
                  .make()
                  .onTap(() {
                Get.to(FilterScreen());
              }),
            ],
          ),
          VxBox(
            child: Column(children: [
              25.heightBox,
              "Maximize Your Harvest\nwith AI-Powered\nCrop Prediction"
                  .text
                  .bold
                  .center
                  .size(20)
                  .white
                  .makeCentered(),
              "Let Our Service Help You Plan for\nSuccess!"
                  .text
                  .bold
                  .center
                  .size(15)
                  .white
                  .makeCentered()
                  .pOnly(top: 18, bottom: 12)
            ]),
          )
              .color(myGreen)
              .customRounded(BorderRadius.circular(10))
              .width(309)
              .make()
              .py32(),
        ])).p0.bottomRounded(value: 45).elevation(15).make(),
        SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CropCard(
                title: articles[index],
              ),
              itemCount: articles.length,
            )).pOnly(top: 45, bottom: 45)
        // const CropCard().pOnly(top: 52).px32()
      ]),
    );
  }
}
