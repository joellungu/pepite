import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pepite/componsants/contr%C3%B4ler/historique_controller.dart';
//import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HistoriqueBon extends StatelessWidget {
  HistoriqueController historiqueBonController =
      Get.put(HistoriqueController());

  HistoriqueBon() {
    historiqueBonController.getListe();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (historiqueBonController.showDetails.value) {
        //var qrCode = QrCode(4, QrErrorCorrectLevel.L)
        //..addData('Hello, world in QR form!');
        Future<QrImage> getImage() async {
          return QrImage(
            data: "Salut comment",
            size: 200,
          );
        }

        return ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.1,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: QrImage(
                data: "Salut comment",
                size: 200,
              ),
            ),
            Text(""),
            SizedBox(
              height: 10,
            ),
            Text(""),
            SizedBox(
              height: 10,
            ),
            Text(""),
          ],
        );
      } else {
        return ListView(
          children: List.generate(
              historiqueBonController.listeHistorique.length, (index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: EdgeInsets.all(3),
                child: ListTile(
                  onTap: () {
                    //historiqueBonController.removeElement(index);
                    //
                    historiqueBonController.detailsBon.value =
                        historiqueBonController.listeHistorique[index];
                    //
                    historiqueBonController.showDetails.value = true;
                    //Get.snackbar(
                    //  "Pioché", "Vous avez pioché le bon de Kin Marche");
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
                    historiqueBonController.listeHistorique[index]
                        ["provenance"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      text: historiqueBonController.listeHistorique[index]
                          ["titre"],
                      children: [
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text: historiqueBonController.listeHistorique[index]
                              ["content"],
                        ),
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text:
                              "Date limite ${historiqueBonController.listeHistorique[index]["datelimite"]}",
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
      }
      ;
    });
  }
}
