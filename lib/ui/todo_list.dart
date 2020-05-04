import 'package:flutter/material.dart';
import 'package:todo_list/ui/add_todo.dart';
import '../models/todo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [Todo(title: 'test', additionalNotes: 'test')];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addTodo(Todo todo) {
    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView.builder(
          itemBuilder: _buildItem,
          itemCount: todos.length,
        ),
        floatingActionButton: _buildFloatingButton(context));
  }

  Widget _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _pushAddTodoScreen(context);
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      subtitle: Text(todo.additionalNotes),
      onChanged: (bool isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('TodoList'),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter todo',
            onPressed: () {}),
        PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Mark All Completed', 'Clear Completed'}
                .map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  void _pushAddTodoScreen(BuildContext context) async {
    // Push this page onto the stack
    final todo = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTodo()));
    _addTodo(todo);
  }
}
