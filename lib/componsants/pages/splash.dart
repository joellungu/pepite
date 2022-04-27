import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pepite/componsants/contr%C3%B4ler/splash_controller.dart';

import 'principale.dart';

class Splash extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());
  checkLogin() async {
    Timer(const Duration(seconds: 3), () {
      Get.off(() => Principale());
    });
    //
    //return splashController.getLoger();
  }

  Splash() {
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Pepite")),
    );
  }
}
