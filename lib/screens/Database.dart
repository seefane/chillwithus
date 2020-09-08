import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DbService {
  final CollectionReference userProfiles =
      FirebaseFirestore.instance.collection('UserProfiles');

  Future<void> createUserProfile(
      String uid, String user_mail, String first_name, String last_name) async {
    return await userProfiles.doc(uid).set({
      //'Uid': uid,
      'Fast_Name': first_name,
      'Last_Name': last_name,
      'User_Email': user_mail,
    });
  }

  Widget getFistandLastName(String userid) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("UserProfiles")
          .doc(userid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Text('Something went wrong'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Text(snapshot.data.get("First_name") +
            " " +
            snapshot.data.get("Last_name"));
      },
    );
  }
}
