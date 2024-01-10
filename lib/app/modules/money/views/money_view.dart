import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:jamaya/app/modules/money/controllers/money_controller.dart';
import 'package:jamaya/app/config/theme.dart';
import 'package:jamaya/app/config/widget/inputs/input_widget.dart';
import 'package:jamaya/app/config/widget/sheets/main_sheet.dart';

class MoneyView extends GetView<MoneyController> {
  const MoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onLongPress: () {
          Get.bottomSheet(
            MainSheetContainer(
              body: [
                InputWidget(
                  title: 'معاك كام 😉😉😂😋',
                  label: 'ها',
                  isNumber: true,
                  controller: controller.moneyController,
                ),
                const SizedBox(
                  height: 9,
                ),
                CupertinoButton(
                  color: AppColors.second,
                  onPressed: () {
                    if (controller.moneyController.text.isNotEmpty &&
                        controller.moneyController.text !=
                            controller.money.value.toString()) {
                      controller.resetMoney(
                        num.parse(
                          controller.moneyController.text,
                        ),
                      );
                    }
                    Get.back();
                  },
                  child: const Text(
                    'اضافة',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: AppColors.goldColor,
          ),
          child: Center(
            child: Text(
              NumberFormat("#,##0.00", "en_US").format(
                  double.parse(controller.money.value.toStringAsFixed(2))),
              style: TextStyle(
                fontSize: 20,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
