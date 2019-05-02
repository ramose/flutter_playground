import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _user = "";
  String _status = "in progress";

  _signIn() {
    setState(() {
      _status = "sign in";
    });

    Auth().handleSignIn().then((FirebaseUser user) {
      print(user);
      setState(() {
        _status = '$user';
      });
    }).catchError((e) {
      print(e);
      setState(() {
        _status = '$e';
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUser().then((res) {
        setState(() {
          _status = res;
        });
      }).catchError((err) {
        print('error: $err');
      });
    });
  }

  Future<String> _checkUser() async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    return firebaseUser.displayName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_user'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$_status'),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _signIn();
            },
          ),
        ],
      )),
    );
  }
}
