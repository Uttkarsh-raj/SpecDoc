import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:specdoc/view/home_screen.dart';
import 'package:specdoc/view/login_screen.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
