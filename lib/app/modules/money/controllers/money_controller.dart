import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaya/app/helpers/keys.dart';

import '../../../helpers/prefs.dart';

class MoneyController extends GetxController {
  final moneyController = TextEditingController();
  final money = Rx<num>(0);

  void changeMoneyTo(
    num mon, {
    bool add = true,
  }) {
    if (add) {
      money.value += mon;
    } else {
      money.value -= mon;
    }
    Prefs.setString(
      PrefsKeys.money,
      money.value.toString(),
    );
  }

  void resetMoney(
    num mon,
  ) {
    money.value = mon;

    Prefs.setString(
      PrefsKeys.money,
      money.value.toString(),
    );
  }

  void refreshMoney() {
    if (Prefs.getString(
      PrefsKeys.money,
    ).isNotEmpty) {
      money.value = num.parse(Prefs.getString(
        PrefsKeys.money,
      ));
    }
  }

  @override
  void onInit() {
    refreshMoney();
    super.onInit();
  }
}
