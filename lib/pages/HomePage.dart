import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/bloc/todos_bloc.dart';
import 'package:todo/models/TodoModels.dart';
import 'package:todo/pages/AddTodoPage.dart';
import 'package:todo/pages/LoginPage.dart';
import 'package:todo/resources/TodoApi.dart';
import 'package:todo/widgets/TodoCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoApiProvider().getAllTodoList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo app"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            } , 
            icon: Icon(Icons.lock)
          )
        
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("Your Todo List:", style: TextStyle(fontSize: 18),),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<TodosBloc,TodosState>(
                  builder: (context, state) {
                    if (state is TodosInitial){
                      return Center(child: CircularProgressIndicator());
                    } else if (state is TodoLoading){
                      return Center(child: CircularProgressIndicator());
                    } else if (state is TodoLoaded){
                      return Column(
                        children: state.model.map((item) => TodoCard(item)).toList(),
                      );
                    } else if (state is TodoError){
                      return Text(state.message.toString());
                    } else {
                      return Text("Something wrong");
                    }
                  },
                ),
              ],
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoPage(),));
        },
        child: Icon(Icons.add),
      )
    );
  }
}