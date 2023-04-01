import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum DaysEnum { today, tomorrow, custom }

enum Types { collection, delivery }

class DeliveryCollectionViewModel extends GetxController {
  List<String> morningSlot = <String>[
    'Select Time',
    '7:00am-8:00am',
    '8:00am-9:00am',
    '9:00am-10:00am',
    '10:00am-11:00am'
  ];
  List<String> afternoonSlot = <String>[
    'Select Time',
    '3:00pm-4:00pm',
    '4:00pm-5:00pm',
    '5:00pm-6:00pm',
    '6:00pm-7:00pm'
  ];

  var collectionSelectedDay = ''.obs;
  var deliverySelectedDay = ''.obs;

  var collectionMorningSlotSelectedValue = ''.obs;
  var collectionAfternoonSlotSelectedValue = ''.obs;
  var deliveryMorningSlotSelectedValue = ''.obs;
  var deliveryAfternoonSlotSelectedValue = ''.obs;

  DateTime now = DateTime.now();
  var tomorrow;
  var formatter = DateFormat('dd MMM');

  Rxn<DateTime> pickedCollectionDate = Rxn<DateTime>();
  Rxn<DateTime> pickedDeliveryDate = Rxn<DateTime>();

  @override
  void onInit() {
    super.onInit();
    tomorrow = DateTime(now.year, now.month, now.day + 1);
  }

  validateData() {
    if (collectionSelectedDay.value == '' || deliverySelectedDay.value == '') {
      showSnackbar('Collection Date and Delivery Date must be selected.');
      return;
    }
    DateTime? collectionSelectedDate;
    DateTime? deliverySelectedDate;

    if (collectionSelectedDay.value == DaysEnum.today.toString()) {
      collectionSelectedDate = now;
    } else if (collectionSelectedDay.value == DaysEnum.tomorrow.toString()) {
      collectionSelectedDate = tomorrow;
    } else {
      collectionSelectedDate = pickedCollectionDate.value;
    }

    if (deliverySelectedDay.value == DaysEnum.today.toString()) {
      deliverySelectedDate = now;
    } else if (deliverySelectedDay.value == DaysEnum.tomorrow.toString()) {
      deliverySelectedDate = tomorrow;
    } else {
      deliverySelectedDate = pickedDeliveryDate.value;
    }

    if (collectionSelectedDay.value == '') {
      showSnackbar('Collection Date must be selected.');
    } else if ((collectionMorningSlotSelectedValue.value == '' ||
            collectionMorningSlotSelectedValue.value == morningSlot.first) &&
        (collectionAfternoonSlotSelectedValue.value == '' ||
            collectionAfternoonSlotSelectedValue.value ==
                afternoonSlot.first)) {
      showSnackbar('Collection Morning or Afternoon slot must be selected.');
    } else if ((deliveryMorningSlotSelectedValue.value == '' ||
        deliveryMorningSlotSelectedValue.value == morningSlot.first) &&
        (deliveryAfternoonSlotSelectedValue.value == '' ||
            deliveryAfternoonSlotSelectedValue.value ==
                afternoonSlot.first)) {
      showSnackbar('Delivery Morning or Afternoon slot must be selected.');
    } else if (deliverySelectedDate!
        .isAtSameMomentAs(collectionSelectedDate!)) {
      showSnackbar('Collection Date and Delivery Date should not be same.');
    } else if (deliverySelectedDate.isBefore(collectionSelectedDate)) {
      showSnackbar('Delivery Date must be after collection Date');
    }
  }

  showSnackbar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: const Duration(milliseconds: 1200),
      ),
    );
  }

  String getTodayDate() {
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String getTomorrowDate() {
    String formattedDate = formatter.format(tomorrow);
    return formattedDate;
  }

  Future<void> pickDate(String type) async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime(now.year, now.month, now.day + 2),
        firstDate: DateTime(now.year, now.month, now.day + 2),
        lastDate: DateTime(now.year + 1, now.month, now.day));
    if (picked != null) {
      if (type == Types.collection.toString()) {
        pickedCollectionDate.value = picked;
      } else {
        pickedDeliveryDate.value = picked;
      }
    }
  }

  String getPickedDate(String type) {
    if (type == Types.collection.toString()) {
      if (pickedCollectionDate.value == null) {
        return '';
      } else {
        return formatter.format(pickedCollectionDate.value!);
      }
    } else {
      if (pickedDeliveryDate.value == null) {
        return '';
      } else {
        return formatter.format(pickedDeliveryDate.value!);
      }
    }
  }
}
