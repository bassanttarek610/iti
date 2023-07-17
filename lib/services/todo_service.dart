// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';

import '../models/todo_model.dart';

class TodoService {
  String url = "https://jsonplaceholder.typicode.com/todos";


  Future<List<TodoModel>> getTodoData() async {
    List<TodoModel> todoList = []; 
    final dio = Dio();
    final response = await dio.get(url);
    print(response);
    var data = response.data;
    data.forEach((jasonElement){
      TodoModel todo = TodoModel.fromJson(jasonElement);
      todoList.add(todo);
    });
    

    return todoList;
    
  }
}
