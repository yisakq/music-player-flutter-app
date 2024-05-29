import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trial/auth/auth_gate.dart';
import 'package:trial/pages/register.dart';
import 'package:trial/themes/light_mode.dart';
import 'auth/Login_or_Register.dart';
import 'pages/login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBjtcKfB05YSmj2SFi4xYPa6bLCd7EFHrA",
        authDomain: "chatapp-7b68c.firebaseapp.com",
        projectId: "chatapp-7b68c",
        storageBucket: "chatapp-7b68c.appspot.com",
        messagingSenderId: "350674804265",
        appId: "1:350674804265:web:f11748c3bdecba21ab8638"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const AuthGate(),
      theme: lightMode,
    );
  }
}