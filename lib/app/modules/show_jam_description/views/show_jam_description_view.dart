import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamaya/app/config/widget/jamaya_description.dart';
import 'package:jamaya/app/modules/money/views/money_view.dart';

import '../controllers/show_jam_description_controller.dart';

class ShowJamDescriptionView extends GetView<ShowJamDescriptionController> {
  const ShowJamDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF00b3b3),
        title: Obx(() => Text(controller.jamaya.value?.name ?? '')),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('هل تريد حذف الجمعية'),
                  actions: [
                    MaterialButton(
                      color: Colors.white,
                      onPressed: () {
                        Get.back();
                        controller.deleteJamaya();
                      },
                      child: const Text(
                        'نعم',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.red,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'لا',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.delete_forever_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: MoneyView(),
          ),
          Expanded(
            child: Obx(
              () => controller.jamaya.value == null
                  ? const Center(
                      child: Text('حدث خطا ما'),
                    )
                  : Obx(() => controller.hasChange.value
                      ? JamayaItemDescription(
                          item: controller.jamaya.value!,
                          onPayed: (value) {
                            controller.payJamaya(
                              jamaya: controller.jamaya.value!,
                              dateId: value.id,
                              isEarn: controller.jamaya.value!.receiveMoneyDates
                                  .where((element) =>
                                      element.date ==
                                      (controller.jamaya.value!.dates
                                              .indexOf(value) +
                                          1))
                                  .isNotEmpty,
                              full: controller.jamaya.value!.receiveMoneyDates
                                          .firstWhereOrNull((element) =>
                                              element.date ==
                                              (controller.jamaya.value!.dates
                                                      .indexOf(value) +
                                                  1)) !=
                                      null
                                  ? controller.jamaya.value!.receiveMoneyDates
                                      .firstWhere((element) =>
                                          element.date ==
                                          (controller.jamaya.value!.dates
                                                  .indexOf(value) +
                                              1))
                                      .full
                                  : true,
                            );
                          },
                          onUnPayed: (value) {
                            controller.payJamaya(
                              jamaya: controller.jamaya.value!,
                              dateId: value.id,
                              pay: false,
                              full: controller.jamaya.value!.receiveMoneyDates
                                          .firstWhereOrNull((element) =>
                                              element.date ==
                                              (controller.jamaya.value!.dates
                                                      .indexOf(value) +
                                                  1)) !=
                                      null
                                  ? controller.jamaya.value!.receiveMoneyDates
                                      .firstWhere((element) =>
                                          element.date ==
                                          (controller.jamaya.value!.dates
                                                  .indexOf(value) +
                                              1))
                                      .full
                                  : true,
                            );
                          },
                        )
                      : JamayaItemDescription(
                          item: controller.jamaya.value!,
                          onPayed: (value) {
                            controller.payJamaya(
                              jamaya: controller.jamaya.value!,
                              dateId: value.id,
                              isEarn: controller.jamaya.value!.receiveMoneyDates
                                  .where((element) =>
                                      element.date ==
                                      (controller.jamaya.value!.dates
                                              .indexOf(value) +
                                          1))
                                  .isNotEmpty,
                              full: controller.jamaya.value!.receiveMoneyDates
                                          .firstWhereOrNull((element) =>
                                              element.date ==
                                              (controller.jamaya.value!.dates
                                                      .indexOf(value) +
                                                  1)) !=
                                      null
                                  ? controller.jamaya.value!.receiveMoneyDates
                                      .firstWhere((element) =>
                                          element.date ==
                                          (controller.jamaya.value!.dates
                                                  .indexOf(value) +
                                              1))
                                      .full
                                  : true,
                            );
                          },
                          onUnPayed: (value) {
                            controller.payJamaya(
                              jamaya: controller.jamaya.value!,
                              dateId: value.id,
                              pay: false,
                              full: controller.jamaya.value!.receiveMoneyDates
                                          .firstWhereOrNull((element) =>
                                              element.date ==
                                              (controller.jamaya.value!.dates
                                                      .indexOf(value) +
                                                  1)) !=
                                      null
                                  ? controller.jamaya.value!.receiveMoneyDates
                                      .firstWhere((element) =>
                                          element.date ==
                                          (controller.jamaya.value!.dates
                                                  .indexOf(value) +
                                              1))
                                      .full
                                  : true,
                            );
                          },
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
