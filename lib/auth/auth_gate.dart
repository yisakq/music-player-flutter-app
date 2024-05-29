import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trial/auth/Login_or_Register.dart';

import '../pages/Home.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return const Home();
    }
          else{
            return const LoginOrRegister();
    }
    }
      ),
    );
  }
}
