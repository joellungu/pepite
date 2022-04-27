import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pepite/componsants/contr%C3%B4ler/accueil_controller.dart';
import 'package:pepite/componsants/widgets/historiquebon.dart';
import 'package:pepite/componsants/widgets/listebon.dart';

class Accueil extends StatelessWidget {
  late AccueilController accueilController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Pepite")
            /*Obx(
            () => accueilController.getEcranIndex() == 0
                ? Text("Accueil")
                : accueilController.getEcranIndex() == 1
                    ? Text("Historique")
                    : Text("Profil"),
          ),
          */
            ),
        body: Obx(
          (() => accueilController.getEcranIndex() == 0
              ? ListeBon()
              : accueilController.getEcranIndex() == 1
                  ? HistoriqueBon()
                  : Container()),
        ),
        bottomNavigationBar: BtmNavBar());
  }
}

class BtmNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BtnNavBar();
  }
}

class _BtnNavBar extends State<BtmNavBar> {
  int v = 0;
  //
  late AccueilController accueilController;
  //= Get.put(()=> AccueilController());
  @override
  void initState() {
    accueilController = Get.find();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (i) {
        setState(() {
          v = i;
          accueilController.setEcranIndex(i);
        });
      },
      currentIndex: v,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Bons"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "Vos bons"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}
