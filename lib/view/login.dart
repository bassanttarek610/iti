// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, duplicate_ignore, unused_local_variable, avoid_print, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/view/task_list.dart';
import 'mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  
  
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
      final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar( title: Text('Login'),
        titleTextStyle: TextStyle(fontSize: 35,color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 173, 102, 196)),
        // ignore: sized_box_for_whitespace
        body: 
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 173, 102, 196),
                        fontWeight: FontWeight.bold)
                  ),
                  Text(
                    "Please enter your login and password!",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(padding: EdgeInsets.all(8.5),
                  child: TextFormField(
                    controller: emailController,
                    decoration: 
                    InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 105, 20, 134)),
                        borderRadius: BorderRadius.circular(50)),
                      label: Text('Email'),
                      prefixIcon: Icon(Icons.person_4_outlined),
                      
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 173, 102, 196)),
                        borderRadius: BorderRadius.circular(50)),
                    ),
                    validator: (value) {
                      if(value!.contains("@")){
                        return null;
                      }
                      else{
                        return "Not valid email";
                      }
                    },
                    ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(8.5, 0, 8.5,0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: 
                      InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Color.fromARGB(255, 173, 102, 196)),
                        ),
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock_outline),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Color.fromARGB(255, 105, 20, 134))
                        ),
                      ),
                      validator: (value) {
                        if(value!.length > 7){
                          return null;
                        }
                        else{
                          return "Password should contains 8 characters or more";
                        }
                      },
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Forgot your password?",
                      style: TextStyle(fontSize: 15,color: Colors.grey), 
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    
                    MaterialButton(onPressed: () async {
                      if( _formKey.currentState!.validate()){
                        bool loginResult = await signinUsingFirebase(emailController.text, passwordController.text);
                    if( loginResult == true ){
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskList()
                    ));
                    } 
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
                    }
                    }
                    else{
                      emailController.clear();
                    }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40), 
                    ),
                    height: 50,
                    minWidth: 200,
                    color: Color.fromARGB(255, 173, 102, 196),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20,color: Colors.white),
                      
                      
                    ),  

                    ),
                    
                    
                ],
              ), 
            ),
            ),
        ),
    );
    }
    saveEmail(String email) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("email", email);
    }

    Future<bool> signinUsingFirebase(String email, String password) async {
      bool result = false;
      try {
        UserCredential userCredential = 
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email ,password: password);
      final user = userCredential.user;
      print(user?.uid);
      saveEmail(user!.email!);
      result = true;
      return result;
      } catch (e) {
        return result;
      }
    }


    

    
}
