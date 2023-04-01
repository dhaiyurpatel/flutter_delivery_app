import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../viewmodel/delivery_collection_viewmodel.dart';

class DateSelectionView extends StatelessWidget {
  String title;
  String type;
  DeliveryCollectionViewModel controller;

  DateSelectionView(
      {super.key,
      required this.title,
      required this.type,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (type == Types.collection.toString()) {
                      controller.collectionSelectedDay.value =
                          DaysEnum.today.toString();
                    } else {
                      controller.deliverySelectedDay.value =
                          DaysEnum.today.toString();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: type == Types.collection.toString()
                        ? controller.collectionSelectedDay.value ==
                                DaysEnum.today.toString()
                            ? Colors.blue
                            : Colors.white
                        : controller.deliverySelectedDay.value ==
                                DaysEnum.today.toString()
                            ? Colors.blue
                            : Colors.white,
                    minimumSize: const Size.fromHeight(70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: type == Types.collection.toString()
                                ? controller.collectionSelectedDay.value ==
                                        DaysEnum.today.toString()
                                    ? Colors.white
                                    : Colors.black
                                : controller.deliverySelectedDay.value ==
                                        DaysEnum.today.toString()
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        controller.getTodayDate(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: type == Types.collection.toString()
                                ? controller.collectionSelectedDay.value ==
                                        DaysEnum.today.toString()
                                    ? Colors.white
                                    : Colors.black
                                : controller.deliverySelectedDay.value ==
                                        DaysEnum.today.toString()
                                    ? Colors.white
                                    : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Obx(
              () => Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (type == Types.collection.toString()) {
                      controller.collectionSelectedDay.value =
                          DaysEnum.tomorrow.toString();
                    } else {
                      controller.deliverySelectedDay.value =
                          DaysEnum.tomorrow.toString();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: type == Types.collection.toString()
                        ? controller.collectionSelectedDay.value ==
                                DaysEnum.tomorrow.toString()
                            ? Colors.blue
                            : Colors.white
                        : controller.deliverySelectedDay.value ==
                                DaysEnum.tomorrow.toString()
                            ? Colors.blue
                            : Colors.white,
                    minimumSize: const Size.fromHeight(70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Tomorrow",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: type == Types.collection.toString()
                                ? controller.collectionSelectedDay.value ==
                                        DaysEnum.tomorrow.toString()
                                    ? Colors.white
                                    : Colors.black
                                : controller.deliverySelectedDay.value ==
                                        DaysEnum.tomorrow.toString()
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      Text(
                        controller.getTomorrowDate(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: type == Types.collection.toString()
                                ? controller.collectionSelectedDay.value ==
                                        DaysEnum.tomorrow.toString()
                                    ? Colors.white
                                    : Colors.black
                                : controller.deliverySelectedDay.value ==
                                        DaysEnum.tomorrow.toString()
                                    ? Colors.white
                                    : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Obx(
              () => Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (type == Types.collection.toString()) {
                      controller.collectionSelectedDay.value =
                          DaysEnum.custom.toString();
                    } else {
                      controller.deliverySelectedDay.value =
                          DaysEnum.custom.toString();
                    }
                    controller.pickDate(type);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: type == Types.collection.toString()
                        ? controller.collectionSelectedDay.value ==
                                DaysEnum.custom.toString()
                            ? Colors.blue
                            : Colors.white
                        : controller.deliverySelectedDay.value ==
                                DaysEnum.custom.toString()
                            ? Colors.blue
                            : Colors.white,
                    minimumSize: const Size.fromHeight(70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Select Date",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: type == Types.collection.toString()
                                ? controller.collectionSelectedDay.value ==
                                        DaysEnum.custom.toString()
                                    ? Colors.white
                                    : Colors.black
                                : controller.deliverySelectedDay.value ==
                                        DaysEnum.custom.toString()
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      Text(
                        controller.getPickedDate(type),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: type == Types.collection.toString()
                                ? controller.collectionSelectedDay.value ==
                                        DaysEnum.custom.toString()
                                    ? Colors.white
                                    : Colors.black
                                : controller.deliverySelectedDay.value ==
                                        DaysEnum.custom.toString()
                                    ? Colors.white
                                    : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
