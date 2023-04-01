import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../viewmodel/delivery_collection_viewmodel.dart';

class TimeSelectionView extends StatelessWidget {
  final String? morningSlotTitle;
  final String? afternoonSlotTitle;
  List<String> morningSlot;
  List<String> afternoonSlot;
  DeliveryCollectionViewModel controller;
  String type;

  TimeSelectionView(
      {super.key,
      required this.morningSlotTitle,
      required this.afternoonSlotTitle,
      required this.morningSlot,
      required this.afternoonSlot,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              morningSlotTitle!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => SizedBox(
                width: Get.width / 2.3,
                child: DropdownButtonFormField<String>(
                  value: type == Types.collection.toString()
                      ? controller.collectionMorningSlotSelectedValue.value ==
                              ''
                          ? morningSlot.first
                          : controller.collectionMorningSlotSelectedValue.value
                      : controller.deliveryMorningSlotSelectedValue.value == ''
                          ? morningSlot.first
                          : controller.deliveryMorningSlotSelectedValue.value,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: morningSlot.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (type == Types.collection.toString()) {
                      controller.collectionMorningSlotSelectedValue.value =
                          newValue!;
                      controller.collectionAfternoonSlotSelectedValue.value =
                          '';
                    } else {
                      controller.deliveryMorningSlotSelectedValue.value =
                          newValue!;
                      controller.deliveryAfternoonSlotSelectedValue.value = '';
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              afternoonSlotTitle!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => SizedBox(
                width: Get.width / 2.3,
                child: DropdownButtonFormField<String>(
                  value: type == Types.collection.toString()
                      ? controller.collectionAfternoonSlotSelectedValue.value ==
                              ''
                          ? afternoonSlot.first
                          : controller
                              .collectionAfternoonSlotSelectedValue.value
                      : controller.deliveryAfternoonSlotSelectedValue.value ==
                              ''
                          ? morningSlot.first
                          : controller.deliveryAfternoonSlotSelectedValue.value,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: afternoonSlot.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (type == Types.collection.toString()) {
                      controller.collectionMorningSlotSelectedValue.value = '';
                      controller.collectionAfternoonSlotSelectedValue.value =
                          newValue!;
                    } else {
                      controller.deliveryMorningSlotSelectedValue.value = '';
                      controller.deliveryAfternoonSlotSelectedValue.value =
                          newValue!;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
