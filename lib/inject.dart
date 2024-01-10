import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jamaya/app/modules/money/controllers/money_controller.dart';
import 'package:jamaya/app/service/offline/databse/db.dart';
import 'package:jamaya/app/service/offline/jamaya.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> inject() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(await SharedPreferences.getInstance(), permanent: true);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: AppColors.whiteColor,
  //   statusBarIconBrightness: Brightness.dark,
  //   statusBarBrightness: Brightness.dark,
  // ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // if (!Platform.isWindows) {
  //   await FCMConfig.instance.init(
  //     defaultAndroidForegroundIcon: '@mipmap/ic_launcher',
  //     //default is @mipmap/ic_launcher
  //     defaultAndroidChannel: const AndroidNotificationChannel(
  //       'high_importance_channel', // same as value from android setup
  //       'Fcm config',
  //       importance: Importance.high,
  //       sound: RawResourceAndroidNotificationSound('notification'),
  //       playSound: true,
  //       enableVibration: true,
  //       enableLights: true,
  //     ),
  //     onBackgroundMessage: _firebaseMessagingBackgroundHandler,
  //     displayInForeground: (notification) {
  //       return true;
  //     },
  //   );
  //   final fcmToken = await FCMConfig.instance.messaging.getToken();
  //   if (fcmToken != null) {
  //     if (Prefs.getString(
  //       PrefsKeys.fcmToken,
  //     ).isEmpty) {
  //       await Prefs.setString(PrefsKeys.fcmToken, fcmToken);
  //     }
  //   }
  // }

  /// * Offline Database
  final db = await DatabaseServices.boot();

  Get.put(db);
  Get.put(DatabaseServices(), permanent: true);
  Get.put(MoneyController(), permanent: true);
  Get.put(JamayaOfflineService(db), permanent: true);
}
