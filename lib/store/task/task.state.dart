import 'package:challenge_01/repo/models/tasks.dart';

class TasksState {
  List<Tasks> tasks;
  String error;
  TasksState({required this.tasks, required this.error});

  factory TasksState.initial() => TasksState(tasks: [], error: '');

  TasksState copyWith({List<Tasks>? newTasks, String? error, bool? isLoading}) {
    return TasksState(
      tasks: newTasks ?? tasks,
      error: error ?? "",
    );
  }
}
