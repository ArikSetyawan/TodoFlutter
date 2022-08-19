import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/bloc/todos_bloc.dart';
import 'package:todo/models/TodoModels.dart';
import 'package:todo/pages/EditTodoPage.dart';

class TodoCard extends StatelessWidget {
  final TodoModel model;

  TodoCard(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditTodoPage(model: model,),));
          },
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 225, 136),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                SizedBox(width: 16,),
                // Widget Expanded for dynamic heigh container;
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(model.todo.toString(), style: TextStyle(fontSize: 16),),
                        SizedBox(height: 4,),
                        Text(model.description.toString(), style: TextStyle(fontSize: 14, color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<TodosBloc>().add(DeleteTodo(todo_id: model.id));
                  }, 
                  icon: Icon(Icons.delete, color: Color.fromARGB(255, 253, 114, 114),)
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 16,)
      ],
    );
  }
}