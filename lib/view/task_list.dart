// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  CollectionReference tasksDocs = FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 173, 102, 196),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: (){Navigator.of(context).pop();},
          icon: Icon(Icons.exit_to_app),
          )),
    
      body: Center(
        child: FutureBuilder<QuerySnapshot<Object?>>(
      future: tasksDocs.get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data == null) {
          return Text("Document does not exist");
        }

        print(snapshot.connectionState.toString());
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                "-: ${snapshot.data!.docs[index]['title']} ==> ${snapshot.data!.docs[index]['status']}",
                style: TextStyle(fontSize: 18,color: Colors.black),
                
                );
            },
          );
        }

        return Text("loading");
      },
    ) ,

    )
    );
  }
}