// ignore_for_file: prefer_const_constructors, unused_label, dead_code, unused_import, prefer_const_constructors_in_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../services/todo_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todo = [];
  bool isLoading = true;

  getTodo() async {
    todo = await TodoService().getTodoData();
    isLoading = false;
    setState(() {});
  }
  

  @override
  void initState() {
    super.initState();
    getTodo();
  }

   Widget build(BuildContext context) {
    return isLoading
    ? Center(
      child: CircularProgressIndicator(),
      
    )

    : ListView.builder(
      itemCount: todo.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(todo[index].title ?? "--"),
        subtitle: Text(todo[index].completed.toString()),

      
      trailing: Icon(Icons.check_box_outline_blank_outlined),
      );
    },
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Home Screen'),
    //     titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
    //     centerTitle: true,
    //     backgroundColor: Color.fromARGB(255, 173, 102, 196),
    //     automaticallyImplyLeading: true,
    //     leading: IconButton(
    //       onPressed: (){Navigator.of(context).pop();},
    //       icon: Icon(Icons.exit_to_app),
    //       )
    //   ));
    
    
      

}
}
