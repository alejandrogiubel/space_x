import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/app/domain/entities/rocket.dart';
import 'package:space_x/app/domain/uses_case/get_rockets.dart';
import 'package:space_x/app/domain/uses_case/use_case_get_rockets.dart';

class HomeController extends GetxController{
  String title = 'Space X';
  UseCaseGetRockets getRockets = GetRockets();
  List<Rocket> rockets = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool showSwipeUpIndicator = false;

  @override
  void onInit() {
    super.onInit();
    _getRockets();
    _showSwipeUpIndicator();
  }

  _getRockets() async {
    rockets = await getRockets.call();
    update(['home_scaffold']);
  }

  _showSwipeUpIndicator() async {
    await Future.delayed(Duration(seconds: 3));
    showSwipeUpIndicator = true;
    update(['swipe_up_indicator']);
    await Future.delayed(Duration(seconds: 5));
    showSwipeUpIndicator = false;
    update(['swipe_up_indicator']);
  }
}
