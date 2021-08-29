import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/app/domain/entities/past_launch.dart';
import 'package:space_x/app/domain/uses_case/get_past_launches.dart';
import 'package:space_x/app/domain/uses_case/use_case_get_past_launches.dart';

class PastLaunchesController extends GetxController{
  UseCaseGetPastLaunches getPastLaunchesUseCase = GetPastLaunches();
  List<PastLaunch> pastLaunches = [];
  String title = 'Past Launches';
  ScrollController scrollController = ScrollController();
  bool readyForNextFetch = true;

  @override
  void onInit() {
    super.onInit();
    getPastLaunches(10, 0);
  }

  getPastLaunches(int limit, int offset) async {
    readyForNextFetch = false;
    pastLaunches.addAll(await getPastLaunchesUseCase.call(limit, offset));
    readyForNextFetch = true;
    update(['missions_list']);
  }
}
