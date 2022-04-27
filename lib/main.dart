import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'componsants/contrôler/accueil_controller.dart';
import 'componsants/pages/splash.dart';

void main() {
  runApp(Pepite());
}

class Pepite extends StatelessWidget {
  AccueilController accueilController = Get.put(AccueilController());
  Pepite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'pepite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
