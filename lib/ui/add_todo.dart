import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class AddTodo extends StatelessWidget {
  Todo todo;
  final titleTextController = TextEditingController();
  final notesTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(title: new Text('Add a new todo')),
        floatingActionButton: _buildFloatingButton(context),
        body: new Column(
            children: <Widget>[_buildTitleTextField(), _buildNoteTextField()]));
  }

  Widget _buildTitleTextField() {
    return new TextField(
      autofocus: true,
      controller: titleTextController,
      decoration: new InputDecoration(
          hintText: 'Enter something to do...',
          contentPadding: const EdgeInsets.all(16.0)),
          
    );
  }

  Widget _buildNoteTextField() {
    return new TextField(
      autofocus: true,
      controller: notesTextController,
      maxLines:5,
      decoration: new InputDecoration(
          hintText: 'additional notes',
          contentPadding: const EdgeInsets.all(16.0)),
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _saveTodo(context);
      },
    );
  }

  _saveTodo(BuildContext context) {
    todo = Todo(title: titleTextController.text, additionalNotes: notesTextController.text);
    Navigator.pop(context,todo);
  }
}
