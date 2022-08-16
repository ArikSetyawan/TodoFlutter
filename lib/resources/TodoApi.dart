import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo/models/TodoModels.dart';

class TodoApiProvider{
  final Dio _dio = Dio();
  final String TodoURL = "http://todo.mastya.my.id/api/todo";

  // Get All Todo List
  Future getAllTodoList() async{
    try {
      Response response = await _dio.get(TodoURL);
      List<TodoModel> listoftodo = [];
      List data = response.data['data'];
      data.forEach((element) {
        listoftodo.add(TodoModel.fromJson(element));
      });
      return listoftodo;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  // Add new Todo
  Future<bool> AddNewTodo(TodoModel newTodo) async{
    try {
      Response response = await _dio.post(TodoURL, data: json.encode(newTodo.toJson()));
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}



class TodoApiRepository{
  final _provider = TodoApiProvider();

  Future getAllTodoList(){
    return _provider.getAllTodoList();
  }

  Future AddNewTodo(TodoModel newTodo){
    return _provider.AddNewTodo(newTodo);
  }
}