import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/app/domain/entities/past_launch.dart';
import 'package:space_x/app/modules/past_launches_module/past_launches_controller.dart';
import 'package:space_x/app/theme/app_text_theme.dart';

class PastLaunchesPage extends GetView<PastLaunchesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: _getBody(),
      backgroundColor: Colors.blueGrey.shade900,
    );
  }

  _getBody() {
    return GetBuilder<PastLaunchesController>(
      id: 'missions_list',
      builder: (_) {
      return Visibility(
        visible: controller.pastLaunches.isNotEmpty,
        child: NotificationListener(
          onNotification: (Notification notification) {
            if (notification is ScrollEndNotification) {
              controller.getPastLaunches(10, controller.pastLaunches.length);
              return true;
            }
            return false;
          },
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.white, indent: 100, endIndent: 100,),
            controller: controller.scrollController,
            itemCount: controller.pastLaunches.length,
            itemBuilder: (context, index) {
              return _descriptionLaunch(controller.pastLaunches[index]);
            }
          ),
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }

  _descriptionLaunch(PastLaunch pastLaunch) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mission name', style: pastLaunchesTitleTextStyle,),
          Text(pastLaunch.missionName, style: pastLaunchesTextStyle,),
          SizedBox(height: 5,),
          Text('Launch date', style: pastLaunchesTitleTextStyle,),
          Text(pastLaunch.launchDateLocal.toString().split(' ')[0], style: pastLaunchesTextStyle,),
          SizedBox(height: 5,),
          Text('Rocket name', style: pastLaunchesTitleTextStyle,),
          Text(pastLaunch.rocket.rocketName, style: pastLaunchesTextStyle,),
          SizedBox(height: 5,),
          Text('Site name', style: pastLaunchesTitleTextStyle,),
          Text(pastLaunch.launchSite.siteNameLong, style: pastLaunchesTextStyle,)
        ],
      ),
    );
  }
}
