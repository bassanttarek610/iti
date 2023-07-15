// ignore_for_file: unused_element, dead_code, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:untitled/profile.dart';
import 'package:untitled/setting.dart';
import 'package:untitled/utils.dart';
import 'package:untitled/widget/myButton.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  final String email;
  MainScreen({super.key,required this.email});

  @override
  State<MainScreen> createState() => _MainScreenState();
  

}

class _MainScreenState extends State<MainScreen> {

  
  int _currentIndex = 0;
  List <Widget> page = [
    HomePage(),
    ProfilePage(),
    SettingPage()
  ];

 
  @override
  
  Widget build(BuildContext context){
    return Scaffold(

          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color.fromARGB(255, 173, 102, 196),


            currentIndex: _currentIndex ,
            onTap: (index) {
              _currentIndex = index;
              setState(() {});
            },


            items:  [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label:"Settings")
            ]),


          body: 
          page.elementAt(_currentIndex),                
          );
        }

        saveEmail(String email) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("email", email); 
    }
        
}