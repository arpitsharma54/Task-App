import 'package:challenge_01/repo/models/tasks.dart';

class TasksState {
  bool loading;
  List<Tasks> tasks;
  String error;
  TasksState(this.loading, this.tasks, this.error);

  factory TasksState.initial() => TasksState(false, [], '');

  TasksState copyWith({bool? loading, List<Tasks>? task, String? error}) {
    return TasksState(
      loading ?? this.loading,
      task ?? this.tasks,
      error ?? this.error,
    );
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TasksState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          tasks == other.tasks &&
          error == other.error;

  @override
  int get hashCode =>
      super.hashCode ^
      runtimeType.hashCode ^
      loading.hashCode ^
      tasks.hashCode ^
      error.hashCode;
}
