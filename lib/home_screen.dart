import 'package:firebase_practice_todo/edit_component.dart';
import 'package:firebase_practice_todo/model/todo.dart';
import 'package:flutter/material.dart';

import 'model/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List <Todo> _todos = [
    Todo(title: "title"),
    Todo(title: "TodoApp")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TodoApp:"),
        ),
        body: ListView.builder(itemCount: _todos.length,
            itemBuilder: (context, index) {
              final todo = _todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Checkbox(value: todo.done,
                  onChanged: (checked) {
                    setState(() {
                      _todos[index] =
                          Todo(title: todo.title, done: checked ?? false);
                    });
                  },),
                onLongPress: ()async{
                  final result =await EditDialog.show(context, todo);
                  if(result !=null){
                    setState(() {
                      _todos[index] = result;
                    });
                  }
                },
              );
            },
        ),
        floatingActionButton:
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            final result = await EditDialog.show(context);
            if (result != null) {
              setState(() {
                _todos.add(result);
              });
            }
          },
        ),
      ),
    );
  }

  static void add(void todo) {}
}