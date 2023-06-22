import 'package:film_admin/screen/Auth/login.dart';
import 'package:film_admin/screen/signup.dart';
import 'package:film_admin/screen/splash.dart';
import 'package:film_admin/screen/test.dart';
import 'package:film_admin/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:film_admin/helper/get_dio.dart' as di;
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ));
  await di.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeModel().lightMode,
      darkTheme: ThemeModel().darkMode,
      //system is light or dark
      themeMode: ThemeMode.system == ThemeMode.system ? ThemeMode.light : ThemeMode.dark,
      home:  splasScreen(),
    );
  }
}



