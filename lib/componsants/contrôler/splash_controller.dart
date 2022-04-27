import 'package:get/get.dart';

class SplashController extends GetxController {
  var homologin = false.obs;

  seLoger(bool v) {
    homologin.value = true;
  }

  bool getLoger() {
    return homologin.value;
  }
}
