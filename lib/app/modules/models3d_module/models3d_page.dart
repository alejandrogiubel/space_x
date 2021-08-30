import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:space_x/app/modules/models3d_module/models3d_controller.dart';

class Models3dPage extends GetView<Models3dController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ModelViewer(
        src: 'assets/models3d/falcon_9.glb',
        alt: "Rocket",
        ar: true,
        backgroundColor: Colors.blueGrey.shade900,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }


}
