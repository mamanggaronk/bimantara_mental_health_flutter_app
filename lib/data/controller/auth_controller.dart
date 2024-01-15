import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _isLogin = false.obs;

  bool get isLogin => _isLogin.value;

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offNamed('/main');
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.code,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signUp(String email, String password, String fullName,
      String phoneNumber) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection('user').add({
        'email': email,
        'fullname': fullName,
        'phone_number': phoneNumber,
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.code,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.code,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
