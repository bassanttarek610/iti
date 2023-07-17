// ignore_for_file: prefer_const_constructors, unused_label, dead_code, unused_import, prefer_const_constructors_in_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view/todo/todo_cubit.dart';

import '../models/todo_model.dart';
import '../services/todo_service.dart';
import 'package:bloc/bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

   Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit,TodoState>(
      builder: (context, state) {

        if(state is TodoLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );}
          else if (state is TodoSuccess) {
            return ListView.builder(
              itemCount: context.watch<TodoCubit>().todo.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(context.watch<TodoCubit>().todo[index].title ?? "--"),
                    subtitle: Text(context.watch<TodoCubit>().todo[index].completed.toString()),

                  
                  trailing: Icon(Icons.check_box_outline_blank_outlined),
                );
              },
            );
          } else {
            return Center(
              child: Text("Error in this screen")
            );
          }
      },
      listener: (context, state) {
        if (state is TodoError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Hello we have an error"),
          ));
        }
      }
    ),
    
      );
   }
}
    // return isLoading
    // ? Center(
    //   
      
    // )

    // : ListView.builder(
    //   itemCount: todo.length,
    // itemBuilder: (BuildContext context, int index) {
    //   return ListTile(
    //     
    //   );
    // },
    // );

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