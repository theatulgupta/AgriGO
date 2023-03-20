import 'package:agri_go/utils/constants.dart';
import 'package:agri_go/views/pages/result_screen.dart';
import 'package:agri_go/views/widgets/select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/data_controller.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final DataController controller = Get.put(DataController());
  String? stateId;
  String? cityId;
  String? soilId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Vx.white,
                ))
              : SingleChildScrollView(
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
                      "Crop Prediction"
                          .text
                          .white
                          .extraBold
                          .size(40)
                          .makeCentered()
                          .pOnly(top: 40, bottom: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/right.svg")
                              .p16()
                              .box
                              .customRounded(BorderRadius.circular(10))
                              .size(57, 57)
                              .color(buttonGreen)
                              .make(),
                          13.widthBox,
                          VxBox(
                            child: DropdownButton(
                                dropdownColor: buttonGreen,
                                iconEnabledColor: Colors.white,
                                icon:
                                    SvgPicture.asset("assets/svg/drop_down.svg")
                                        .pOnly(left: 20),
                                focusColor: myGreen,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                value: stateId,
                                hint: "Select State".text.white.make(),
                                items: controller.stateList.map((e) {
                                  return DropdownMenuItem(
                                    onTap: () {
                                      controller.isLoading.value = true;
                                      controller.fetchCity(e.id);
                                      cityId = null;
                                    },
                                    value: e.id,
                                    child: e.name.text
                                        .color(Vx.white)
                                        .makeCentered(),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    stateId = newValue.toString();
                                  });
                                }).centered(),
                          )
                              .color(buttonGreen)
                              .size(250, 57)
                              .customRounded(BorderRadius.circular(10))
                              .makeCentered(),
                        ],
                      ),
                      45.heightBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/right.svg")
                              .p16()
                              .box
                              .customRounded(BorderRadius.circular(10))
                              .size(57, 57)
                              .color(buttonGreen)
                              .make(),
                          13.widthBox,
                          VxBox(
                            child: DropdownButton(
                                dropdownColor: buttonGreen,
                                iconEnabledColor: Colors.white,
                                icon:
                                    SvgPicture.asset("assets/svg/drop_down.svg")
                                        .pOnly(left: 20),
                                focusColor: myGreen,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                value: cityId,
                                hint: "Select City".text.white.make(),
                                items: controller.cityList.map((e) {
                                  return DropdownMenuItem(
                                    onTap: () {
                                      controller.isLoading.value = true;
                                      controller.fetchSoil(e.id);
                                      cityId = null;
                                    },
                                    value: e.id,
                                    child: e.name.text
                                        .color(Vx.white)
                                        .makeCentered(),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    cityId = newValue.toString();
                                  });
                                }).centered(),
                          )
                              .color(buttonGreen)
                              .size(250, 57)
                              .customRounded(BorderRadius.circular(10))
                              .makeCentered(),
                        ],
                      ),
                      45.heightBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/star.svg")
                              .p16()
                              .box
                              .customRounded(BorderRadius.circular(10))
                              .size(57, 57)
                              .color(buttonGreen)
                              .make(),
                          13.widthBox,
                          VxBox(
                            child: DropdownButton(
                                dropdownColor: buttonGreen,
                                iconEnabledColor: Colors.white,
                                icon:
                                    SvgPicture.asset("assets/svg/drop_down.svg")
                                        .pOnly(left: 20),
                                focusColor: myGreen,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                value: soilId,
                                hint: "Select Soil Type".text.white.make(),
                                items: controller.soilList.map((e) {
                                  return DropdownMenuItem(
                                    value: e.id,
                                    child: e.name.length <= 15
                                        ? e.name.text.color(Vx.white).make()
                                        : e.name.text
                                            .color(Vx.white)
                                            .overflow(TextOverflow.ellipsis)
                                            .make(),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    soilId = newValue.toString();
                                  });
                                }).centered().px20(),
                          )
                              .color(buttonGreen)
                              .height(57)
                              .width(250)
                              .customRounded(BorderRadius.circular(10))
                              .makeCentered(),
                        ],
                      ),
                      80.heightBox,
                      "Predict Crop"
                          .text
                          .bold
                          .size(28)
                          .color(myGreen)
                          .makeCentered()
                          .box
                          .height(60)
                          .width(290)
                          .color(Colors.white)
                          .customRounded(BorderRadius.circular(10))
                          .make()
                          .onTap(() {
                        controller.isLoading(true);
                        if (stateId != null &&
                            cityId != null &&
                            soilId != null) {
                          controller.fetchCrops(stateId!, cityId!, soilId!);
                          Get.to(() => ResultScreen());
                        } else {
                          Get.snackbar("Error fetching prediction",
                              "Please Select Required Fields");
                        }
                      })
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
