import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import './screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'screens/home.dart';

final FirebaseAuth _fire_auth = FirebaseAuth.instance;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.blue[900],
//             title: Text("Welcome to Y movies"),
//           ),
//           body: logIn_screen())));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    if (userState() == true) {
//      return home();
//    } else {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.indigo[900],
          accentColor: Colors.blue[900],
        ),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              title: Text("Welcome to Y movies"),
            ),
            body: logIn_screen()));
    // }
  }
}
