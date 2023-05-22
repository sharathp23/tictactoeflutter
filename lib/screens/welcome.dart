import 'package:flutter/material.dart';
import 'package:flutter_tictactoe/screens/login.dart';
import 'package:flutter_tictactoe/screens/signup.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Welcome to Tic Tac Toe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
            'images/homeStyle.png',
            height: 50.0,
          ),
          SizedBox(
            height: 48.0,
          ),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            elevation: 5.0,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              minWidth: 200.0,
              height: 42.0,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            elevation: 5.0,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              minWidth: 200.0,
              height: 42.0,
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

