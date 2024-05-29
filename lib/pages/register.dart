import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trial/auth/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
class Register extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPw = TextEditingController();
  final void Function()? onTap;

  Register({super.key,required this.onTap});
  void register(BuildContext context) {
    //get auth service
    final _auth=AuthService();
    //password match -> create a user
    if(_pwController.text==_confirmPw.text){
      try{
        _auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
      }catch (e){
        showDialog(context: context, builder: (context)=>AlertDialog(title:Text(e.toString()),));

      }
    }
    //password dont match->error
    else{
      showDialog(context: context, builder: (context)=>AlertDialog(title:Text("Password don't match"),));

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
              "Lets create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25,),
            //email and pass
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
            //confirm pw
            Mytextfield(
              obscureText: true,
              hintText: "Confirm Password",
              controller: _confirmPw,
            ),
            const SizedBox(
              height: 25,
            ),
            //login button
            Mybutton(
              text: "Register",
              onTap: ()=>register(context),
            ),
            const SizedBox(
              height: 25,
            ),

            //register now
            Row(
                mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Already have an account?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary), ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(fontWeight: FontWeight.bold,
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
