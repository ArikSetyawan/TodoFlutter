import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/models/TodoModels.dart';
import 'package:todo/resources/TodoApi.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial()) {
    final TodoApiRepository _apiRepository = TodoApiRepository();

    on<GetTodoList>((event, emit) async{
      print("executed");
      // TODO: implement event handler
      try {
        emit(TodoLoading());
        final TodoList = await _apiRepository.getAllTodoList();
        emit(TodoLoaded(TodoList));
      } catch (e) {
        emit(TodoError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
