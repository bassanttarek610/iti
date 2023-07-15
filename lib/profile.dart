// ignore_for_file: prefer_const_constructors, unused_element, dead_code, override_on_non_overriding_member

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/mainScreen.dart';
import 'package:untitled/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget{
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>

{
  String userEmail = ""; 
  @override
  void initstate() {
    super.initState();
    getEmail();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 173, 102, 196),
        automaticallyImplyLeading: false,
      ),

      // body: Center(
      //   child: Text(userEmail)

      body: Center(
        child: Text(userEmail,
        style: TextStyle(fontSize: 30),
        )
        ),
      
        
               
      // ),  
    );
  }

  getEmail() async {
          userEmail = await getEmail();
          setState(() {});
        }
}