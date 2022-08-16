// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
    TodoModel({
        required this.id,
        required this.todo,
        required this.description,
    });

    int id;
    String todo;
    String description;

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        todo: json["todo"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "description": description,
    };
}
