import 'package:challenge_01/repo/models/tasks.dart';
import 'package:challenge_01/repo/repositry.dart';
import 'package:challenge_01/store/app.state.dart';
import 'package:challenge_01/store/task/task.actions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'task.state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> fetchTasks(Repositry repo) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    dispatch(action);

    try {
      print("INSIDE FETCH TASKS");
      final res = await repo.fetchTasks();
      List<Tasks> taskList = [];
      if (res != null) {
        taskList = res;
      }
      store.dispatch(FetchTaskSuccesAction(newTaskList: taskList));
    } on DioError catch (error) {
      dispatch(FetchTaskFailedAction(error: error.message.toString()));
      throw error;
    } catch (error) {
      print(error);
      dispatch(FetchTaskFailedAction(error: error.toString()));
    }
  };
}

Middleware<AppState> addTask(Repositry repo) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    dispatch(action);
    try {
      AddTaskAction ac = action as AddTaskAction;
      await repo.addNewTask({"taskTitle": ac.taskTitle});
      store.dispatch(FetchTaskAction());
    } on DioError catch (error) {
      throw error;
    }
  };
}

Middleware<AppState> deleteTask(Repositry repo) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    dispatch(action);
    try {
      DeleteTaskAction ac = action as DeleteTaskAction;
      await repo.deleteTask(ac.id);
      store.dispatch(FetchTaskAction());
    } on DioError catch (error) {
      store.dispatch(DeleteTaskFailedAction(error: error.message.toString()));
      throw error;
    }
  };
}
