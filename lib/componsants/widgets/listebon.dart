import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contrôler/listebon_controller.dart';

class ListeBon extends StatelessWidget {
  ListBonController listBonController = Get.put(ListBonController());
  //
  ListeBon() {
    Timer(Duration(seconds: 2), () {
      listBonController.getListe();
    });
  }
  //
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        children: List.generate(listBonController.listeDeBons.length, (index) {
          return Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: ListTile(
                onTap: () {
                  listBonController.removeElement(index);
                  Get.snackbar(
                      "Pioché", "Vous avez pioché le bon de Kin Marche");
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue,
                  ),
                ),
                title: Text(
                  listBonController.listeDeBons[index]["provenance"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    text: listBonController.listeDeBons[index]["titre"],
                    children: [
                      TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text: listBonController.listeDeBons[index]["content"],
                      ),
                      TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text:
                            "Date limite ${listBonController.listeDeBons[index]["datelimite"]}",
                        style: TextStyle(
                          color: Colors.green.shade700,
                        ),
                      )
                    ],
                  ),
                ),
                trailing: Text(
                  "122/300 bons disponibles",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
