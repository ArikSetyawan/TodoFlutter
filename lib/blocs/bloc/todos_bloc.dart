import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/models/TodoModels.dart';
import 'package:todo/resources/TodoApi.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial()) {
    final TodoApiRepository _apiRepository = TodoApiRepository();

    // Get All Todo Bloc
    on<GetTodoList>((event, emit) async{
      // TODO: implement event handler
      try {
        emit(TodoLoading());
        final TodoList = await _apiRepository.getAllTodoList();
        if (TodoList == false){
          emit(TodoError("Server offline"));
        }
        emit(TodoLoaded(TodoList));
      } catch (e) {
        emit(TodoError("Failed to fetch data. is your device online?"));
      }
    });

    // Create New Todo Bloc
    on<AddTodo>((event, emit) async{
      try {
        emit(TodoLoading());
        final CreateNewTodo = await _apiRepository.AddNewTodo(event.newTodo);
        if (CreateNewTodo == true){
          final TodoList = await _apiRepository.getAllTodoList();
          emit(TodoLoaded(TodoList));
        } else {
          emit(TodoError("Server Error"));
        }
      } catch (e) {
        emit(TodoError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
