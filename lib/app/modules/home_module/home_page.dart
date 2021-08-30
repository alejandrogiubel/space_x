import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:parallax_animation/parallax_area.dart';
import 'package:parallax_animation/parallax_widget.dart';
import 'package:space_x/app/domain/entities/rocket.dart';
import 'package:space_x/app/modules/home_module/home_controller.dart';
import 'package:space_x/app/modules/home_module/widgets/home_drawer.dart';
import 'package:space_x/app/theme/app_text_theme.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'home_scaffold',
      builder: (_) {
        return Scaffold(
          key: controller.scaffoldKey,
          body: Stack(
            children: [
              _parallax(),
              _appBar(),
              _swipeUpIndicator()
            ],
          ),
          endDrawer: HomeDrawer(),
        );
      }
    );
  }

  _parallax() {
    return ParallaxArea(
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.rockets.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return ParallaxWidget(
              child: _rocketsDetails(index),
              overflowWidthFactor: 1.5,
              background: Image.asset(
                'assets/rockets/${controller.rockets[index].id}.jpg',
                filterQuality: FilterQuality.low,
              ),
            );
          }
      ),
    );
  }

  _rocketsDetails(int index) {
    Rocket rocket = controller.rockets[index];
    return PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ClipRect(
              child: Container(
                color: Colors.black26,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5, tileMode: TileMode.mirror),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rocket.name,
                          style: titleTextStyle,
                        ),
                        Text(rocket.description,
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company',
                  style: titleTextStyle,
                ),
                Text(rocket.company,
                  style: subtitleTextStyle,
                ),
                SizedBox(height: 10,),
                Text('Country',
                  style: titleTextStyle,
                ),
                Text(rocket.country,
                  style: subtitleTextStyle,
                ),
                SizedBox(height: 10,),
                Text('Active',
                  style: titleTextStyle,
                ),
                Text(rocket.active ? 'Yes' : 'No',
                  style: subtitleTextStyle,
                ),
                SizedBox(height: 10,),
                Text('Cost Per Launch',
                  style: titleTextStyle,
                ),
                Text('\$ ' + rocket.costPerLaunch.toString(),
                  style: subtitleTextStyle,
                ),
                Text('Boosters',
                  style: titleTextStyle,
                ),
                Text(rocket.boosters.toString(),
                  style: subtitleTextStyle,
                ),
                SizedBox(height: 10,),
                Text('Diameter',
                  style: titleTextStyle,
                ),
                Text(rocket.diameter.meters.toString() + ' m',
                  style: subtitleTextStyle,
                ),
                SizedBox(height: 10,),
                Text('Engines type',
                  style: titleTextStyle,
                ),
                Text(rocket.engines.type,
                  style: subtitleTextStyle,
                ),
                SizedBox(height: 10,),
                Text('Engines propellant 1',
                  style: titleTextStyle,
                ),
                Text(rocket.engines.propellant1,
                  style: subtitleTextStyle,
                ),
                SizedBox(height: 10,),
                Text('Engines propellant 2',
                  style: titleTextStyle,
                ),
                Text(rocket.engines.propellant2,
                  style: subtitleTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _appBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Image.asset('assets/images/spacex.png',
              height: 30,
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                controller.scaffoldKey.currentState!.openEndDrawer();
              },
              color: Colors.white,
              icon: Icon(Icons.menu, size: 35,)
            )
          ],
        ),
      ),
    );
  }

  _swipeUpIndicator() {
    return GetBuilder<HomeController>(
      id: 'swipe_up_indicator',
      builder: (_) {
      return Visibility(
        visible: controller.showSwipeUpIndicator,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.black45,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 50, sigmaY: 50, tileMode: TileMode.repeated),
                  child: Lottie.asset(
                    'assets/lottie_files/swipe_gesture_up.json',),
                ),
              ),
            )
          ),
        ),
      );
    });
  }
}
