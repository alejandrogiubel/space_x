
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/app/modules/home_module/home_bindings.dart';
import 'package:space_x/app/modules/home_module/home_page.dart';
import 'package:space_x/app/routes/app_pages.dart';
import 'package:space_x/app/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Space X',
    debugShowCheckedModeBanner: false,   
    initialRoute: '/',   
    theme: appThemeData,   
    defaultTransition: Transition.fade,   
    getPages: AppPages.pages,
    home: HomePage(),
    initialBinding: HomeBinding(),
  ));   
}