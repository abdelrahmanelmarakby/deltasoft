import 'package:deltasoft/app/data/product_model.dart';
import 'package:deltasoft/core/services/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/app_pages.dart';
import 'core/services/bindings.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future main() async {
  //* HIVE OPERATIONS
  await WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ProductModelAdapter());
  Hive.openBox("products");
  //*APP
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: Binding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      defaultTransition: Transition.size,
    ),
  );
}
