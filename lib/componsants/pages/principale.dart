import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contrôler/splash_controller.dart';
import 'accueil.dart';
import 'login.dart';

class Principale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        title: const Text(""),
        elevation: 0,
      ),
      body: Obx((() => splashController.getLoger() ? Accueil() : Login())),
    );
  }
}
