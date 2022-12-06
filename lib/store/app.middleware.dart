import 'package:challenge_01/repo/repositry.dart';
import 'package:challenge_01/store/app.state.dart';
import 'package:challenge_01/store/task/task.actions.dart';
import 'package:challenge_01/store/task/task.middleware.dart';
import 'package:challenge_01/store/task/task.state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> appMiddleware(Repositry repo) {
  final Middleware<AppState> tasksMw = fetchTasks(repo);
  final Middleware<AppState> addTaskMw = addTask(repo);
  final Middleware<AppState> deleteTaskMw = deleteTask(repo);
  return [
    TypedMiddleware<AppState, FetchTaskAction>(tasksMw),
    TypedMiddleware<AppState, AddTaskAction>(addTaskMw),
    TypedMiddleware<AppState, DeleteTaskAction>(deleteTaskMw),
  ];
}
