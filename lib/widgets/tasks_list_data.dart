import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';

import '../models/tasks.dart';

class TasksListData with ChangeNotifier {
  List<Tasks> _tasks = [
    // Tasks(tasksTitle: 'Cook Rice and Chicken at 10am'),
    // Tasks(tasksTitle: 'Learn Reactjs at 12pm'),
    // Tasks(tasksTitle: 'Have Launch at 1pm'),
    // Tasks(tasksTitle: 'Learn HTML ans css at 3pm'),
    // Tasks(tasksTitle: 'Have Dinner at 8pm'),
  ];

  List<Tasks> get tasks {
    return [..._tasks];
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
        'https://challenge01-8f6ba-default-rtdb.firebaseio.com/tasks.json');
    try {
      final response = await http.get(url);
      final extractedTasks = json.decode(response.body) as Map<String, dynamic>;

      final List<Tasks> loadedTasks = [];
      extractedTasks.forEach((key, value) {
        loadedTasks.add(
          Tasks(
            tasksTitle: value['tasksTitle'],
            id: key,
          ),
        );
      });

      _tasks = loadedTasks;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addNew(Tasks task) async {
    final url = Uri.parse(
        'https://challenge01-8f6ba-default-rtdb.firebaseio.com/tasks.json');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'tasksTitle': task.tasksTitle,
          },
        ),
      );

      final newTask = Tasks(
        tasksTitle: task.tasksTitle,
        id: json.decode(response.body)['name'],
      );
      _tasks.add(newTask);

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deletTasks(String id) async {
    final url = Uri.parse(
        'https://challenge01-8f6ba-default-rtdb.firebaseio.com/tasks/$id.json');

    final existingTaskIndex = _tasks.indexWhere((taskId) => taskId.id == id);
    var existingTask = _tasks[existingTaskIndex];

    _tasks.removeAt(existingTaskIndex);
    notifyListeners();

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _tasks.insert(existingTaskIndex, existingTask);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
  }
}
