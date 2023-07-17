import 'package:flutter/material.dart';

class MyButton extends StatefulWidget{
  final String label;
  const MyButton({super.key,required this.label});

  @override
  State<MyButton> createState() => _MyButton();
}

class _MyButton extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.8),
      child: Container(
        width: 200,
        height: 50,
        decoration: 
        BoxDecoration(
          color: Color.fromARGB(255, 173, 102, 196),
          borderRadius: BorderRadius.circular(40),
        ),
        
        child: Center(child: Text(widget.label, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        

      ),
    );
  }
}