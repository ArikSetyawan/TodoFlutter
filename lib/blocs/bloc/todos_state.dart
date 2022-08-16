part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();
  
  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodoLoading extends TodosState {}

class TodoLoaded extends TodosState {
  final List<TodoModel> model;

  const TodoLoaded(this.model);
}

class TodoError extends TodosState{
  final String? message;

  const TodoError(this.message);
}