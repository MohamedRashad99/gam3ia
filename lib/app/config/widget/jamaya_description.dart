import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaya/app/config/theme.dart';
import 'package:jamaya/app/models/jamaya.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class JamayaItemDescription extends StatelessWidget {
  final ValueChanged<Dates> onPayed;
  final ValueChanged<Dates> onUnPayed;
  final JamayaModel item;

  const JamayaItemDescription({
    Key? key,
    required this.item,
    required this.onPayed,
    required this.onUnPayed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: item.dates
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 8,
              ),
              child: GestureDetector(
                onLongPress: () {
                  if (e.payed) {
                    if (item.receiveMoneyDates
                        .where((element) =>
                            element.date == (item.dates.indexOf(e) + 1))
                        .isNotEmpty) {
                      return;
                    } else {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('هل تريد الرجوع في الدفع'),
                          actions: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {
                                onUnPayed(e);
                                Get.back();
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
                    }
                  } else {
                    return;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0X3300b3b3),
                            offset: Offset(0, 4),
                            blurRadius: 4),
                      ],
                      color: item.receiveMoneyDates
                              .where((element) =>
                                  element.date == (item.dates.indexOf(e) + 1))
                              .isNotEmpty
                          ? AppColors.goldColor
                          : const Color(0X8000b3b3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                          child: Card(
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                (item.dates.indexOf(e) + 1).toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: !e.payed ? 2 : 1,
                                child: Text(
                                  DateFormat('MM/dd').format(
                                    e.startDate,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              if (e.payed &&
                                  item.receiveMoneyDates
                                      .where((element) =>
                                          element.date ==
                                          (item.dates.indexOf(e) + 1))
                                      .isEmpty) ...[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        ((num.parse(item.price) *
                                                    (item.receiveMoneyDates
                                                        .where((element) =>
                                                            element.full)
                                                        .toList()
                                                        .length)) +
                                                ((num.parse(item.price) / 2) *
                                                    (item.receiveMoneyDates
                                                        .where((element) =>
                                                            !element.full)
                                                        .toList()
                                                        .length)))
                                            .toStringAsFixed(0),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                              if (e.payed &&
                                  item.receiveMoneyDates
                                      .where((element) =>
                                          element.date ==
                                          (item.dates.indexOf(e) + 1))
                                      .isEmpty)
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        e.payed ? 'تم الدفع' : '',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (!e.payed)
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      Get.dialog(
                                        AlertDialog(
                                          title: const Text('هل تريد الدفع'),
                                          actions: [
                                            MaterialButton(
                                              color: Colors.white,
                                              onPressed: () {
                                                onPayed(e);
                                                Get.back();
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
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          item.receiveMoneyDates
                                                  .where((element) =>
                                                      element.date ==
                                                      (item.dates.indexOf(e) +
                                                          1))
                                                  .isNotEmpty
                                              ? 'اجمع'
                                              : 'ادفع',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF00b3b3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
