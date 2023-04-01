import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/delivery_collection_viewmodel.dart';
import '../widget/date_selection_view.dart';
import '../widget/time_selection_view.dart';

class DeliveryCollectionView extends GetView<DeliveryCollectionViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateSelectionView(
                  title: 'Select Collection Date & Time',
                  type: Types.collection.toString(),
                  controller: controller,
                ),
                const SizedBox(
                  height: 20,
                ),
                TimeSelectionView(
                  morningSlotTitle: 'Morning',
                  morningSlot: controller.morningSlot,
                  afternoonSlotTitle: 'Afternoon',
                  afternoonSlot: controller.afternoonSlot,
                  controller: controller,
                  type: Types.collection.toString(),
                ),
                const SizedBox(
                  height: 20,
                ),
                DateSelectionView(
                  title: 'Select Delivery Date & Time',
                  type: Types.delivery.toString(),
                  controller: controller,
                ),
                const SizedBox(
                  height: 20,
                ),
                TimeSelectionView(
                  morningSlotTitle: 'Morning',
                  morningSlot: controller.morningSlot,
                  afternoonSlotTitle: 'Afternoon',
                  afternoonSlot: controller.afternoonSlot,
                  controller: controller,
                  type: Types.delivery.toString(),
                ),
                const SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.validateData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
