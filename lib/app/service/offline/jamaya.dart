import 'dart:developer';

import 'package:get/get.dart';
import 'package:jamaya/app/helpers/keys.dart';
import 'package:jamaya/app/helpers/prefs.dart';
import 'package:jamaya/app/models/jamaya.dart';
import 'package:jamaya/app/modules/money/controllers/money_controller.dart';
import 'package:jamaya/app/service/offline/databse/database_services.dart';
import 'package:sqflite/sqflite.dart';

class JamayaOfflineService extends BaseTableService<JamayaModel> {
  JamayaOfflineService(Database db) : super(db, JamayaModel.databaseName);

  final moneyController = Get.find<MoneyController>();

  Future<void> addJamayaa({
    required JamayaModel user,
  }) async {
    await db.insert(
      name,
      user.toMap(),
    );

    log('Added New $name');
  }

  @override
  Future<List<JamayaModel>> findManyFromDb([String keyword = '']) async {
    final res = await db.query(name);
    return res.map((e) => JamayaModel.fromSql(e)).toList();
  }

  Future<JamayaModel?> findOneById({required int id}) async {
    final res = await db.query(
      name,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (res.isNotEmpty) {
      return res
          .map(
            (e) => JamayaModel.fromSql(e),
          )
          .toList()
          .first;
    } else {
      return null;
    }
  }

  Future<void> pay({
    required JamayaModel jamaya,
    required int dateId,
    bool pay = true,
    bool full = true,
    bool isEarn = false,
  }) async {
    // final jamaya = await findOneById(id: id);
    // if (jamaya == null) return;
    if (moneyController.money.value == 0 && pay && !isEarn) {
      throw 'برجاء اضافة رصيد';
    }
    final index = jamaya.dates.indexWhere((element) => element.id == dateId);
    final payed = jamaya.dates[index].copyWith(payed: pay);
    jamaya.dates[index] = payed;
    await db.update(
      name,
      jamaya
          .copyWith(
            dates: jamaya.dates,
          )
          .toMap(),
      where: 'id = ?',
      whereArgs: [jamaya.id],
    );
    log('😍😍😍${Prefs.getString(PrefsKeys.money)}');
    moneyController.changeMoneyTo(
      (num.parse(jamaya.price) *
              (jamaya.receiveMoneyDates
                  .where((element) => element.full)
                  .toList()
                  .length)) +
          ((num.parse(jamaya.price) / 2) *
              (jamaya.receiveMoneyDates
                  .where((element) => !element.full)
                  .toList()
                  .length)),
      add: !pay,
    );
    log('😍😍😍${Prefs.getString(PrefsKeys.money)}');

    if (isEarn) {
      moneyController.changeMoneyTo(
        (full
            ? num.parse(jamaya.price) * num.parse(jamaya.number)
            : (num.parse(jamaya.price) * num.parse(jamaya.number)) / 2),
      );
      log('%%%${(full ? num.parse(jamaya.price) * num.parse(jamaya.number) : (num.parse(jamaya.price) * num.parse(jamaya.number)) / 2)}');
    }
    log('😍😍😍${Prefs.getString(PrefsKeys.money)}');
    log('${jamaya.number} is Payed Successfully 🙋‍♀️🙋‍♂️');
  }
}
