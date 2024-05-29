import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trial/auth/auth_service.dart';
import 'package:trial/components/my_button.dart';
import 'package:trial/components/my_textfield.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  Login({super.key, required this.onTap});
//login method
  void login(BuildContext context) async {
    //auth service
    final authService=AuthService();
    //try login
    try{
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    }catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(title:Text(e.toString()),));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),

            //welcome message
            Text(
              "Welcome",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //email
            Mytextfield(
              obscureText: false,
              hintText: "Email",
              controller: _emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            Mytextfield(
              obscureText: true,
              hintText: "Password",
              controller: _pwController,
            ),
            const SizedBox(
              height: 25,
            ),

            //login button
            Mybutton(
              text: "Login",
              onTap:()=> login(context),
            ),
            const SizedBox(
              height: 25,
            ),

            //register now
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(
                "Not a member?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
