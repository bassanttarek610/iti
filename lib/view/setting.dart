// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';


class SettingPage extends StatefulWidget {
  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 173, 102, 196),
        automaticallyImplyLeading: false,
        ),

        body: Center(
        child: Text("Settings",
        style: TextStyle(fontSize: 16),
        )
      ),
      
    );
  }
}