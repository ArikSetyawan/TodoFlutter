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

class DeleteTodo extends TodosEvent{
  final int todo_id;
  
  DeleteTodo({required this.todo_id});
}

class EditTodo extends TodosEvent{
  final int todo_id;
  final String todo;
  final String description;

  EditTodo(this.todo_id, this.todo, this.description);
}
