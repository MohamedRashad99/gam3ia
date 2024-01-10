import 'package:get/get.dart';

import '../controllers/show_jam_description_controller.dart';

class ShowJamDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowJamDescriptionController>(
      () => ShowJamDescriptionController(),
    );
  }
}
