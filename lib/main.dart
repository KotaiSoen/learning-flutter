// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'todo.dart';

void main() {
  runApp(MaterialApp(
    home: TodoApp()
  ));
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  List todos = [];

  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Todo-List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Row(
              children: [
                Container(
                  height: 40.0,
                  width: 140.0,
                  color: Colors.grey[100],
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        )
                      ),
                      
                    ),
                    cursorColor: Colors.black,
                  )
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      todos.add(Todo(name: todoController.value.text, completed: false));
                      todoController.clear();
                    });
                  },
                  child: Text('Add'),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: todos[index].completed,
                      onChanged: (bool? value) {
                        setState(() {
                          todos[index].completed = value!;
                        });
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);               
                        });
                      },
                    ),
                    title: Text(todos[index].name),
                  );
                }
              ),
            )
          ],
        ),
      )
    );
  }
}