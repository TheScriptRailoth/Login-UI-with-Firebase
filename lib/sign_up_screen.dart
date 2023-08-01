import 'package:flutter/material.dart';
import 'package:untitled1/reusable_text.dart';

import 'home_screen.dart';
class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  final TextEditingController _passwordTextContoller = TextEditingController();
  final TextEditingController _emailTextContoller = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
          ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
          Colors.red,
          Colors.blue
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter
          )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2,20,0),
            child: Column(
              children: <Widget>[
                const SizedBox( height: 20,),
                reusableTextfield("Enter UserName", Icons.person_outline, false, _userNameTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextfield("Enter Email Id", Icons.email_outlined, true, _emailTextContoller),
                SizedBox(
                  height: 20,
                ),
                reusableTextfield("Enter Password", Icons.lock_outline, true, _passwordTextContoller),
                signInsignUpButton(context,false, (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                })
              ],
            ),
          ),
        ),
    )
    );
  }
  TextField reusableTextfield(String text, IconData icon, bool isPasswordType,
      TextEditingController controller) {
    return TextField(controller: controller,
      obscureText: isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70,),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }

  Container signInsignUpButton(
      BuildContext context, bool isLogin, Function onTap) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(isLogin ? 'Log In' : 'Sign Up', style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)
                ))
        ),
      ),
    );
  }
}
