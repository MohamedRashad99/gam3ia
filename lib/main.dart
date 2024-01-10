import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:jamaya/inject.dart';
import 'package:jamaya/app/config/translate/messages.dart';
import 'package:jamaya/app/helpers/keys.dart';
import 'package:jamaya/app/helpers/prefs.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await inject();
  // await Get.find<DatabaseServices>().clear();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => GetMaterialApp(
        title: "Application",
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            // PointerDeviceKind.stylus,
            // PointerDeviceKind.unknown
          },
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        locale: Locale(Prefs.getString(PrefsKeys.lang).isEmpty
            ? 'ar'
            : Prefs.getString(PrefsKeys.lang)),
        translations: Messages(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        fallbackLocale: const Locale('ar'),
      ),
    ),
  );
}
