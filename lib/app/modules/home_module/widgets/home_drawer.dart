import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/app/routes/app_pages.dart';
import 'package:space_x/app/theme/app_text_theme.dart';

class HomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black38, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20, tileMode: TileMode.mirror),
          child: Drawer(
            child: SafeArea(
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Image.asset('assets/images/spacex_logo.png',
                              height: 30,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Tomorrow is today',
                            style: titleDrawerTextStyle,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text('Past launches',
                        style: drawerTextStyle,
                      ),
                      onTap: () => Get.toNamed(Routes.PAST_LAUNCHES),
                    ),
                    ListTile(
                      title: Text('Upcoming launches',
                        style: drawerTextStyle,
                      ),
                    ),
                    ListTile(
                      title: Text('Missions',
                        style: drawerTextStyle,
                      ),
                    ),
                    ListTile(
                      title: Text('Users',
                        style: drawerTextStyle,
                      ),
                    ),
                    ListTile(
                      title: Text('3D models',
                        style: drawerTextStyle,
                      ),
                      onTap: () => Get.toNamed(Routes.MODELS3D),
                    ),
                    ListTile(
                      title: Text('About',
                        style: drawerTextStyle,
                      ),
                      onTap: () => Get.toNamed(Routes.ABOUT),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
