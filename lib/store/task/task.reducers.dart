import 'package:challenge_01/store/task/task.actions.dart';
import 'package:challenge_01/store/task/task.state.dart';
import 'package:redux/redux.dart';

final taskReducer = combineReducers<TasksState>([
  TypedReducer<TasksState, FetchTaskAction>(_getTask),
  TypedReducer<TasksState, FetchTaskSuccesAction>(_getSuccesTask),
  TypedReducer<TasksState, FetchTaskFailedAction>(_getFailedTask),
  TypedReducer<TasksState, DeleteTaskFailedAction>(_deleteFailedTask),
]);

TasksState _getTask(TasksState state, FetchTaskAction action) {
  return state.copyWith(loading: true, error: "");
}

TasksState _getSuccesTask(TasksState state, FetchTaskSuccesAction action) {
  print("_getSuccesTask");
  return state.copyWith(loading: false, task: action.newTaskList);
}

TasksState _getFailedTask(TasksState state, FetchTaskFailedAction action) =>
    state.copyWith(loading: false, error: action.error);

TasksState _deleteFailedTask(TasksState state, DeleteTaskFailedAction action) =>
    state.copyWith(loading: false, error: action.error);
