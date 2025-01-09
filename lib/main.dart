import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_search/model/results.dart';
import 'package:music_search/page/main_page/main_page_page.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await dbInit();
  runApp(const MyApp());
}

//数据库初始化
Future dbInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory documentDir = await getApplicationDocumentsDirectory();
  await documentDir.create();

  await Hive.initFlutter(documentDir.path);
  Hive.registerAdapter(ResultsAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(),
          home: const MainPagePage(),
        );
      },
    );
  }
}
