import 'package:challenge_01/store/task/task.state.dart';

class AppState {
  final TasksState taskState;
  AppState({required this.taskState});

  factory AppState.initial() => AppState(taskState: TasksState.initial());
}
