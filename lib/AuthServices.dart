import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth fire_auth = FirebaseAuth.instance;

class Auth_Services {
  bool _result;
  var usermail;

  User getUserCred() {
    final User user = fire_auth.currentUser;
    return user;
  }

  Future<bool> userState() async {
    var user = await fire_auth.currentUser;
    return user != null;
  }

  signOut() {
    return fire_auth.signOut();
  }
}
