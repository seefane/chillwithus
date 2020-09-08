import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'Database.dart';
import 'home.dart';

//import 'package:flutter/material.dart';

final FirebaseAuth _fire_auth = FirebaseAuth.instance;

class signUp_screen extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _signUp_screen();
  }
}

class _signUp_screen extends State<signUp_screen> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cornfirm_pass = TextEditingController();

  bool _result;
  String _usermail;
  String _error;
  //String _userid;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue[800], Colors.blue[100]])),
          child: Form(
            key: _formkey,
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _firstname,
                    decoration: InputDecoration(labelText: "First Name"),
                  ),
                  TextFormField(
                    controller: _lastname,
                    decoration: InputDecoration(labelText: "Last Name"),
                  ),
                  TextFormField(
                    controller: _email,
                    decoration:
                        InputDecoration(labelText: "Please Enter your email"),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(labelText: "Create password"),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _cornfirm_pass,
                    decoration: InputDecoration(labelText: "Confirm password"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter password";
                      } else if (value != _password.text)
                        return "Please enter matching passwords";
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[800],
                                borderRadius: BorderRadius.circular(15.0)),
                            child: FlatButton(
                              child: Text("Sign Up"),
                              onPressed: () async {
                                if (_formkey.currentState.validate()) {
                                  _register();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));

                                  //else
                                  // Scaffold.of(context).showSnackBar(SnackBar(
                                  //     content:
                                  //         Text("Passwords are not matching")));
                                }
                                return null;
                              },
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[800],
                                borderRadius: BorderRadius.circular(15.0)),
                            child: FlatButton(
                                child: Text(
                                  "Clear Fields",
                                ),
                                onPressed: () async {
                                  _resetInputs();
                                }),
                          )),
                    ],
                  ),
                  Container(
                    width: 400.0,
                    decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(15.0)),
                    alignment: Alignment.center,
                    height: 50.5,
                    child: Text(_result == null
                        ? ''
                        : (_result
                            ? 'Registration Successfull ' + _usermail
                            : _error)),
                  )
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    try {
      final User user = (await _fire_auth.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      ))
          .user;
      await DbService().createUserProfile(
          user.uid, user.email, _firstname.text, _lastname.text);
      user.sendEmailVerification();
      if (user != null) {
        setState(() {
          _result = true;
          _usermail = user.email;
        });
      } else {
        setState(() {
          _result = false;
        });
      }
    } catch (e) {
      setState(() {
        _result = false;
      });
      var _error2 = e.toString();
      _error = e.toString().substring(_error2.indexOf(']') + 1);
      print(_error);
    }
  }

  void _resetInputs() {
    _email.clear();
    _cornfirm_pass.clear();
    _password.clear();
    _firstname.clear();
    _lastname.clear();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _cornfirm_pass.dispose();
    _firstname.dispose();
    _lastname.dispose();
    super.dispose();
  }
}
