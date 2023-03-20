import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:snippet_coder_utils/FormHelper.dart";
import "package:velocity_x/velocity_x.dart";

import "../../controller/data_controller.dart";

class DropDownScreen extends StatelessWidget {
  DropDownScreen({Key? key}) : super(key: key);

  final DataController controller = Get.put(DataController());

  String? stateId;
  String? cityId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "AgriGO".text.make(),
      ),
      body: Obx(
        () => Column(
          children: [
            // State
            FormHelper.dropDownWidgetWithLabel(context, "States",
                "Select State", stateId, controller.stateList,
                    (onChangeVal) {
              stateId = onChangeVal;
              controller.fetchCity(stateId!);
              cityId = null;
            }, (onValidate) {
              if (onValidate == null) {
                return "Please Select State";
              }
              return null;
            },
                borderColor: Colors.blueAccent,
                borderFocusColor: Colors.blue,
                borderRadius: 10),

            // City
            FormHelper.dropDownWidgetWithLabel(
                context, "City", "Select City", cityId, controller.cityList,
                (onChangeVal) {
              cityId = onChangeVal;
            }, (onValidate) {
              return null;
            },
                optionValue: "Id",
                borderColor: Colors.blueAccent,
                borderFocusColor: Colors.blue,
                borderRadius: 10),
          ],
        ),
      ),
    );
  }
}
