import 'package:agri_go/controller/services/api_services.dart';
import 'package:agri_go/model/city_model.dart';
import 'package:agri_go/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../controller/data_controller.dart';
import '../../model/state_model.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final DataController controller = Get.put(DataController());

  String? states;
  String? cities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Creating States DropDown Button
                    VxBox(
                      child: DropdownButton(
                          iconEnabledColor: Colors.white,
                          icon: SvgPicture.asset("assets/svg/drop_down.svg")
                              .pOnly(left: 20),
                          focusColor: myGreen,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          value: states,
                          hint: "Please Select State".text.white.make(),
                          items: controller.stateList.map((e) {
                            return DropdownMenuItem(
                              onTap: () {
                                controller.isLoading.value = true;
                                // controller.cityList.clear();
                                controller.fetchCity(e.id);
                                cities = null;
                              },
                              value: e.id,
                              child: e.name.text
                                  .color(dropDownTextColor)
                                  .makeCentered(),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              states = newValue.toString();
                            });
                          }).centered(),
                    )
                        .color(buttonGreen)
                        .size(250, 57)
                        .customRounded(BorderRadius.circular(10))
                        .makeCentered(),
                    30.heightBox,
                    VxBox(
                      child: DropdownButton(
                          iconEnabledColor: Colors.white,
                          icon: SvgPicture.asset("assets/svg/drop_down.svg")
                              .pOnly(left: 20),
                          focusColor: myGreen,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          value: cities,
                          hint: "Please Select City".text.white.make(),
                          items: controller.cityList.map((e) {
                            return DropdownMenuItem(
                              value: e.id,
                              child:
                                  e.name.text.color(dropDownTextColor).make(),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              cities = newValue.toString();
                            });
                          }).centered(),
                    )
                        .color(buttonGreen)
                        .size(250, 57)
                        .customRounded(BorderRadius.circular(10))
                        .makeCentered(),
                  ],
                ),
        ),
      ),
    );
  }
}
