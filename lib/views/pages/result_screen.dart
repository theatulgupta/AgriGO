import 'package:agri_go/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/data_controller.dart';
import '../widgets/crop_card.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final DataController controller = Get.put(DataController());

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        controller.extractCrops();
        controller.isLoading(false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.isLoading.value ? myGreen : lightGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            VxBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.heightBox,
                  Container(
                    alignment: const Alignment(-1, -1),
                    child: const Icon(
                      CupertinoIcons.arrow_left,
                      size: 35,
                      color: Colors.white,
                    ).onTap(() {
                      Get.back();
                    }),
                  ).pOnly(left: 20),
                  40.heightBox,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SvgPicture.asset("assets/svg/indicator.svg"),
                    25.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        "Rajasthan".text.white.bold.size(24).make(),
                        30.heightBox,
                        "Ajmer".text.white.bold.size(24).make(),
                        30.heightBox,
                        "Alluvial Soil".text.white.bold.size(24).make()
                      ],
                    ).box.height(170).make(),
                  ]),
                  50.heightBox,
                ],
              ),
            )
                .color(myGreen)
                .bottomRounded(value: controller.isLoading.value ? 0 : 35)
                .make(),
            100.heightBox,
            controller.isLoading.value
                ? const LoadingAnimation()
                : SizedBox(
                    height: 270,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CropCard(
                        title: controller.crops[index],
                      ),
                      itemCount: controller.crops.length,
                    )).pOnly(top: 45, bottom: 45)
          ]),
        ),
      ),
    );
  }
}

// class CropsList extends StatelessWidget {
//   const CropsList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) => CropCard(),
//         itemCount: 3,
//       ).py16(),
//     );
//   }
// }

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Column(
        children: [
          Lottie.asset(
            'assets/gif/loading_anim.json',
            height: 250,
            width: 250,
          ),
          20.heightBox,
          "Fetching data with AI".text.white.center.size(24).bold.make()
        ],
      ),
    ).color(myGreen).make().whFull(context);
  }
}
