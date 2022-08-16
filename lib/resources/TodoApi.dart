import 'package:dio/dio.dart';
import 'package:todo/models/TodoModels.dart';

class TodoApiProvider{
  final Dio _dio = Dio();
  final String get_all_todo_url = "http://todo.mastya.my.id/api/todo";

  Future<List<TodoModel>> getAllTodoList() async{
    try {
      Response response = await _dio.get(get_all_todo_url);
      List<TodoModel> listoftodo = [];
      List data = response.data['data'];
      data.forEach((element) {
        listoftodo.add(TodoModel.fromJson(element));
      });
      return listoftodo;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      List<TodoModel> listoftodo = [];
      return listoftodo;
    }
  }

}

class TodoApiRepository{
  final _provider = TodoApiProvider();

  Future<List<TodoModel>> getAllTodoList(){
    return _provider.getAllTodoList();
  }
}