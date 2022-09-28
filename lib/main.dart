import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rebase/routes/app_pages.dart';

import 'config/configs.dart';
import 'di/main_bindings.dart';

Future<void> main() async {
  await AppConfig.appConfig();
  runApp(
    DevicePreview(
      enabled: false, // !kReleaseMode,
      builder: (context) {
        return ScreenUtilInit(
          designSize: const Size(
            ScreenUtilsConfig.designWidth,
            ScreenUtilsConfig.designHeight,
          ),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      locale: Get.deviceLocale,
      initialRoute: AppPages.initial,
      onInit: () {
        //todo: dynamic Link
      },
    );
  }
}
