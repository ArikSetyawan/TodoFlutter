import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/bloc/todos_bloc.dart';
import 'package:todo/models/TodoModels.dart';

class EditTodoPage extends StatefulWidget {
  final TodoModel model;
  const EditTodoPage({required this.model});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {

  // FormKey for Validator
  final _formKey = GlobalKey<FormState>();

  // TextController
  final _TodoNameField = TextEditingController();
  final _TodoDetailField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
      ),
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  TextFormField(
                    autofocus: true,
                    controller: _TodoNameField..text = widget.model.todo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Todo Name"),
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Please fill it!~";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: _TodoDetailField..text = widget.model.description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Description")
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Please fill it!~";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final isValidated = _formKey.currentState!.validate();
                        if (isValidated){
                          final todo_id = widget.model.id;
                          final todo = _TodoNameField.text;
                          final description = _TodoDetailField.text;
                          context.read<TodosBloc>().add(EditTodo(todo_id, todo, description));
                          Navigator.pop(context);
                        }
                      }, 
                      child: Text("Submit!"),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}