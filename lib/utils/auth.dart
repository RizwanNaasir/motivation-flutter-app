import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Auth extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool rememberMe = false;

  toggleRememberMe() {
    rememberMe = !rememberMe;
    log('rememberMe: $rememberMe + ${username.text} + ${password.text}');
    update();
  }
}
