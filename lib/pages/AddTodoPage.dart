import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/bloc/todos_bloc.dart';
import 'package:todo/models/TodoModels.dart';

class AddTodoPage extends StatefulWidget {
  AddTodoPage({ Key? key }) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  // FormKey for Validator
  final _formKey = GlobalKey<FormState>();

  // TextController
  final _TodoNameField = TextEditingController();
  final _TodoDetailField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
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
                    controller: _TodoNameField,
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
                    controller: _TodoDetailField,
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
                          var newTodo = TodoModel(
                            id: 1, 
                            todo: _TodoNameField.text, 
                            description: _TodoDetailField.text
                          );
                          context.read<TodosBloc>().add(AddTodo(newTodo: newTodo));
                          Navigator.pop(context);
                        }else{
                          print(false);
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