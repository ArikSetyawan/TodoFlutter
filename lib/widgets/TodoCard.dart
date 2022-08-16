import 'package:flutter/material.dart';
import 'package:todo/models/TodoModels.dart';

class TodoCard extends StatelessWidget {
  final TodoModel model;

  TodoCard(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print("tabep");
          },
          child: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 225, 136),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.todo.toString(), style: TextStyle(fontSize: 16),),
                    SizedBox(height: 4,),
                    Text(model.description.toString(), style: TextStyle(fontSize: 14, color: Colors.grey),)
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {print("Btn Delete Pressed");}, 
                  icon: Icon(Icons.delete)
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