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

  // Delete Todo
  Future DeleteTodo(int todo_id) async{
    try {
      Response response = await _dio.delete(TodoURL, queryParameters: {'todo_id':todo_id} );
      return true;
    } catch (e) {
      return false;
    }
  }

  // Update Todo
  Future UpdateTodo(int todo_id, String todo, String description) async {
    try {
      var data = {"todo_id":todo_id,"todo":todo,"description":description};
      Response response = await _dio.put(TodoURL, data: json.encode(data));
      return true;
    } catch (e) {
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

  Future DeleteTodo(int todo_id){
    return _provider.DeleteTodo(todo_id);
  }

  Future UpdateTodo(int todo_id, String todo, String description){
    return _provider.UpdateTodo(todo_id, todo, description) ;
  }
}