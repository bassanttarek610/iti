// ignore_for_file: unused_element, dead_code, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, unused_import, unnecessary_import

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'profile.dart';
import 'setting.dart';

class MainScreen extends StatefulWidget {
  final String email;
  
  MainScreen({super.key, required this.email});

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
        
        
        
}