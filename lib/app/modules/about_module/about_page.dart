import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/app/modules/about_module/about_controller.dart';
import 'package:space_x/app/modules/about_module/widgets/background1.dart';
import 'package:space_x/app/modules/about_module/widgets/background2.dart';
import 'package:space_x/app/theme/app_text_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends GetView<aboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Stack(
        children: [
          CustomPaint(
            painter: Background1(
              color: Colors.blueGrey.shade800
            ),
            size: Size.infinite,
          ),
          CustomPaint(
            painter: Background2(
              color: Colors.black45
            ),
            size: Size.infinite,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/splash/splash.png',
                height: 200,
              ),
              SizedBox(height: 20,),
              Text('Developed by', style: aboutTextStyle,),
              Text('Alejandro Giubel Hernandez Arbelo', style: aboutTextStyle,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/icon/telegram_64px.png',
                        height: 40,
                      ),
                      Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(1000),
                              onTap: () {
                                launch("https://telegram.me/agiubel");
                              },
                            ),
                          )
                      )
                    ],
                  ),
                  IconButton(
                      iconSize: 40,
                      splashRadius: 25,
                      onPressed: () {
                        final Uri params = Uri(
                          scheme: 'mailto',
                          path: 'agiubel@gmail.com',
                          query: 'subject=Space X App &body=App Version 1.0.0', //add subject and body here
                        );
                        launch(params.toString());
                      },
                      icon: Icon(Icons.email_outlined, color: Colors.white,)
                  ),
                ],
              )
            ],
          ),
        ],
      )
    );
  }
}
