import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

final FirebaseAuth _fire_auth = FirebaseAuth.instance;

class logIn_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _logIn_screen();
  }
}

class _logIn_screen extends State<logIn_screen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  bool isloading = true;

  Widget _signUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return signUp_screen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    AssetImage imgAsset = AssetImage('images/cinema.png');
    Image logIn = Image(
      image: imgAsset,
      width: 200.1,
      height: 200.2,
    );
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft, end: Alignment.bottomRight,
                //stops: [0.1,0.4]
                colors: [Colors.blue[800], Colors.blue[100]])),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(55.0),
                child: logIn,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Log In",
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (val) =>
                      val.length < 6 ? 'Short password,6 chars minimum' : null,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: double.infinity,
                    height: 50.5,
                    child: RaisedButton(
                        color: Colors.blueGrey[800],
                        child: Text("Log In"),
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            _signInWithEmailAndPassword();
                          }
                        })),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Dont have an account?"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(10.0)),
                      child: FlatButton(
                          child: Text("Sign up"), onPressed: _signUp),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    String message = "";
    try {
      final User user = (await _fire_auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
          message = "Successfully signed in";
        });
      } else {
        setState(() {
          _success = false;
        });
      }
    } catch (e) {
      var _error2 = e.toString();
      message = e.toString().substring(_error2.indexOf(']') + 1);
      //return null;
    }
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.blue),
      ),
      duration: Duration(seconds: _success == true ? 2 : 4),
    ));
    if (_success) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }
}
