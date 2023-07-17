import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/todo_model.dart';
import 'package:untitled/services/todo_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()) {
    getTodo();
  }

  List<TodoModel> todo = [];
  bool isLoading = true;

  getTodo() async {
    
    emit(TodoLoading());
    try {
      todo = await TodoService().getTodoData();
      isLoading = false;
      // throw Exception();
      emit(TodoSuccess());
    } catch(e) {
      print(e.toString());
      emit(TodoError());
    }
  }
}
