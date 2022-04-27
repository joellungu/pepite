import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pepite/componsants/contr%C3%B4ler/splash_controller.dart';
import 'package:pepite/componsants/pages/accueil.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _nomComplet = TextEditingController();
  final _emailController = TextEditingController();
  bool logBool = true;
  //
  SplashController splashController = Get.find();

  @override
  void initState() {
    super.initState();

    /*
    _emailController.addListener(() {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Email value ${_emailController.text}"),
      ));
    });
    */
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: logBool
          ? Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'email@example.com', labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Password', labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    onChanged: (value) {
                      //print("Password value $value");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /*
                        Timer(const Duration(seconds: 4), () {
                          Get.snackbar("Correct", "Un simple message!");
                        });
                        */
                        //Get.off(Accueil());
                        //
                        splashController.seLoger(true);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          logBool = false;
                        });
                      },
                      child: const Text("Pas de compte ? Cliqué ici"))
                ],
              ),
            )
          : Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'John Jhonson', labelText: 'Nom complet'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    controller: _nomComplet,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'email@example.com', labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Password', labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    onChanged: (value) {
                      //print("Password value $value");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /*
                        Timer(Duration(seconds: 4), () {
                          Get.snackbar("Correct", "Un simple message!");
                        });
                        */

                        //
                        //Get.off(Accueil());
                        //
                        splashController.seLoger(true);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          logBool = true;
                        });
                      },
                      child: const Text("Déjà un compte ? Authentifiez-vous"))
                ],
              ),
            ),
    );
  }
}
