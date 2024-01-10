import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaya/app/models/jamaya.dart';
import 'package:jamaya/app/modules/money/controllers/money_controller.dart';
import 'package:jamaya/app/service/offline/jamaya.dart';

class HomeController extends GetxController {
  final service = Get.find<JamayaOfflineService>();
  final jamyaat = <JamayaModel>[].obs;
  final receiveMoneyDates = <ReceiveMoneyDateModel>[].obs;
  final startDate = Rx<DateTime?>(null);
  final jamName = TextEditingController();
  final jamNumber = TextEditingController();
  final jamPrice = TextEditingController();
  final jamReceivePrice = TextEditingController();

  final loading = false.obs;
  final addLoading = false.obs;

  Future<void> getAll() async {
    try {
      loading.value = true;

      jamyaat.assignAll(
        await service.findManyFromDb(),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar(
        'error',
        e.toString(),
      );
    } finally {
      loading.value = false;
    }
  }

  final moneyController = Get.find<MoneyController>();
  Future<void> addJamaya() async {
    try {
      if (moneyController.money.value == 0) throw 'برجاء اضافة رصيد';
      if (jamName.text.isEmpty) throw 'برجاء ادخال الاسم';
      if (jamNumber.text.isEmpty) throw 'برجاء ادخال العدد';
      if (jamPrice.text.isEmpty) throw 'برجاء ادخال السعر';
      if (startDate.value == null) throw 'برجاء ادخال تاريخ البدء';

      addLoading.value = true;
      await service.addJamayaa(
        user: JamayaModel(
          name: jamName.text,
          price: jamPrice.text,
          number: jamNumber.text,
          dates: List.generate(
            int.parse(jamNumber.text),
            (index) => Dates(
              id: index + 1,
              startDate: DateTime(
                startDate.value!.year,
                startDate.value!.month + index,
                startDate.value!.day,
              ),
            ),
          ),
          receiveMoneyDates: receiveMoneyDates,
        ),
      );
      await getAll();
      jamName.clear();
      jamNumber.clear();
      jamPrice.clear();
      jamReceivePrice.clear();
      receiveMoneyDates.clear();
      startDate.value = null;
      Get.back();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar(
        'error',
        e.toString(),
      );
    } finally {
      addLoading.value = false;
    }
  }

  Future<void> setDate() async {
    try {
      startDate.value = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2050),
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
    getAll();
    super.onInit();
  }

  @override
  void onReady() {
    jamReceivePrice.addListener(
      () {
        if (jamReceivePrice.text.isNotEmpty &&
            int.parse(jamReceivePrice.text) > 0) {
          receiveMoneyDates.addAll(
            List.generate(
              int.parse(jamReceivePrice.text),
              (index) => ReceiveMoneyDateModel(
                date: 0,
                id: index + 1,
              ),
            ),
          );
        }
      },
    );
    super.onReady();
  }

  void addReceiveDate(
      {required ReceiveMoneyDateModel receive, String? date, bool? value}) {
    final index = receiveMoneyDates.indexOf(receive);
    final newItem = receiveMoneyDates[index].copyWith(
      date: date != null ? int.parse(date) : null,
      full: value,
    );
    receiveMoneyDates[index] = newItem;
  }
}
