import 'dart:developer';

import 'package:get/get.dart';
import 'package:jamaya/app/models/jamaya.dart';
import 'package:jamaya/app/service/offline/jamaya.dart';

class ShowJamDescriptionController extends GetxController {
  final JamayaModel args = Get.arguments;
  final jamaya = Rx<JamayaModel?>(null);
  final service = Get.find<JamayaOfflineService>();

  Future<void> payJamaya({
    required JamayaModel jamaya,
    required int dateId,
    bool pay = true,
    required bool full,
    bool isEarn = false,
  }) async {
    try {
      await service.pay(
        jamaya: jamaya,
        dateId: dateId,
        pay: pay,
        isEarn: isEarn,
        full: full,
      );
      payOffline(
        dateId: dateId,
        pay: pay,
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar(
        'error',
        e.toString(),
      );
    }
  }

  final hasChange = false.obs;
  void payOffline({
    required int dateId,
    bool pay = true,
  }) {
    try {
      final dateItemIndex =
          jamaya.value!.dates.indexWhere((element) => element.id == dateId);
      if (dateItemIndex != -1) {
        final dateNew = jamaya.value!.dates[dateItemIndex].copyWith(
          payed: pay,
        );
        jamaya.value!.dates[dateItemIndex] = dateNew;
      }
      hasChange.value = !hasChange.value;
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar(
        'error',
        e.toString(),
      );
    }
  }

  Future<void> deleteJamaya() async {
    try {
      await service.deleteOneById(
        args.id!,
      );

      Get.back(
        result: true,
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar(
        'error',
        e.toString(),
      );
    }
  }

  @override
  void onInit() {
    jamaya.value = args;
    super.onInit();
  }
}
