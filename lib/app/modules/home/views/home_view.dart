import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jamaya/app/config/widget/receive_money_item.dart';
import 'package:jamaya/app/modules/money/views/money_view.dart';
import 'package:skeletons/skeletons.dart';
import 'package:intl/intl.dart';
import 'package:jamaya/app/config/theme.dart';
import 'package:jamaya/app/config/widget/inputs/input_widget.dart';
import 'package:jamaya/app/config/widget/jamaya_item.dart';
import 'package:jamaya/app/config/widget/sheets/main_sheet.dart';
import 'package:jamaya/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0XFF00b3b3),
        title: Text(
          'جمعياتي',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MoneyView(),
          ),
        ],
      ),

      body: Obx(
        () => controller.loading.value
            ? SkeletonListView(
                itemBuilder: (p0, p1) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                      bottom: context.height * 0.022,
                    ),
                    height: context.height * 0.28,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(26)),
                      color: AppColors.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0X40000000),
                          offset: Offset(0, 1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: 3,
              )
            : RefreshIndicator(
                onRefresh: controller.getAll,
                child: controller.jamyaat.isEmpty
                    ? ListView(
                        children: [
                          SizedBox(
                            height: context.height * .3,
                          ),
                          Center(
                            child: Text(
                              'من فضلك اضف جمعية جديدة',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.jamyaat.length,
                        itemBuilder: (context, index) => JamayaItem(
                          item: controller.jamyaat[index],
                          onTap: (value) async {
                            final res = await Get.toNamed(
                              Routes.SHOW_JAM_DESCRIPTION,
                              arguments: value,
                            );
                            if (res ?? false) {
                              controller.getAll();
                            }
                          },
                        ),
                      ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            MainSheetContainer(
              body: [
                InputWidget(
                  title: 'اسم الجمعية',
                  label: 'الاسم',
                  controller: controller.jamName,
                ),
                InputWidget(
                  title: 'عددها',
                  label: 'العدد',
                  isNumber: true,
                  controller: controller.jamNumber,
                ),
                InputWidget(
                  title: 'سعرها',
                  label: 'بكام',
                  isNumber: true,
                  controller: controller.jamPrice,
                ),
                const SizedBox(
                  height: 9,
                ),
                InputWidget(
                  title: 'داخل بكام فرد',
                  label: 'بكام',
                  isNumber: true,
                  controller: controller.jamReceivePrice,
                ),
                Obx(
                  () => Column(
                    children: controller.receiveMoneyDates
                        .map(
                          (element) => ReceiveItem(
                            onChanged: (value) {
                              controller.addReceiveDate(
                                receive: element,
                                date: value,
                              );
                            },
                            value: element.full,
                            onValueChanged: (value) {
                              controller.addReceiveDate(
                                receive: element,
                                value: value,
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'تاريخ البدء',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                InkWell(
                  onTap: controller.setDate,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(35)),
                      border: Border.all(
                        color: const Color(0xFFCDCCCC),
                      ),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          controller.startDate.value == null
                              ? 'تاريخ البدء'
                              : DateFormat('yyyy-MM-dd').format(
                                  controller.startDate.value!,
                                ),
                          style: TextStyle(
                            color: controller.startDate.value == null
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                  color: AppColors.second,
                  onPressed: controller.addJamaya,
                  child: const Text(
                    'اضافة جمعية',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
        backgroundColor: const Color(0XFF00b3b3),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
