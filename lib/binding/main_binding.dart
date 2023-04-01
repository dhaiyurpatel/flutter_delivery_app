import 'package:get/get.dart';

import '../viewmodel/delivery_collection_viewmodel.dart';

class MainBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => DeliveryCollectionViewModel());
  }

}