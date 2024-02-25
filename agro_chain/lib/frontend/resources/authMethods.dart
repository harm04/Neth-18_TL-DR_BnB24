import 'package:agro_chain/frontend/onBoarding/page1.dart';
import 'package:agro_chain/frontend/utils/snackbar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signup(
      {required String email,
      required String username,
      required String password,
      required BuildContext context}) async {
    String res = 'some error occured';
    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      try {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _firestore.collection('User').doc(cred.user!.uid).set({
          'email': email,
          'password': password,
          'username': username,
        });
        res = 'success';
      } catch (err) {
        res = err.toString();
      }
    } else {
      res = 'Please enter all fields';
    }
    return res;
  }

  Future<String> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String res = 'some error occured';
    if (email.isNotEmpty && password.isNotEmpty) {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res == 'success';
    }

    //   try{
    // await _auth.signInWithEmailAndPassword(email: email, password: password);
    //     res ='success';
    //     showSnackbar(context, 'Login success');
    //   }catch(err){
    //     res = err.toString();
    //   }
    // }
    else {
      showSnackbar('Please enter all the fields', context);
    }
    return res;
  }

  Future<String> logout() async {
    String res = 'some error occured';
    await _auth.signOut();
    res = 'success';
    return res;
  }

  checkUser() {
    if (_auth.currentUser != null) {
      return const Page1();
    } else {
      // return LoginScreen();
    }
  }
}
