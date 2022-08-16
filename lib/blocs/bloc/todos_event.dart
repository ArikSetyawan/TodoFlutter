part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetTodoList extends TodosEvent{}

class AddTodo extends TodosEvent{
  final TodoModel newTodo;

  AddTodo({ required this.newTodo});
}
