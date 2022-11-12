import 'package:challenge_01/store/task/task.actions.dart';
import 'package:challenge_01/store/task/task.state.dart';
import 'package:redux/redux.dart';

final taskReducer = combineReducers<TasksState>([
  TypedReducer<TasksState, FetchTaskSuccesAction>(_getSuccesTask),
  TypedReducer<TasksState, FetchTaskFailedAction>(_getFailedTask),
  TypedReducer<TasksState, DeleteTaskSuccessAction>(_deleteSuccessTask),
  TypedReducer<TasksState, DeleteTaskFailedAction>(_deleteFailedTask),
]);

TasksState _getSuccesTask(TasksState state, FetchTaskSuccesAction action) =>
    state.copyWith(newTasks: action.newTaskList);

TasksState _getFailedTask(TasksState state, FetchTaskFailedAction action) =>
    state.copyWith(error: action.error);

TasksState _deleteSuccessTask(
        TasksState state, DeleteTaskSuccessAction action) =>
    state.copyWith(newTasks: action.newList);

TasksState _deleteFailedTask(TasksState state, DeleteTaskFailedAction action) =>
    state.copyWith(error: action.error);
