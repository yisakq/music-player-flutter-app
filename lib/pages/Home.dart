import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void logout(){
    //get auth service
    final _auth=AuthService();
    _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
