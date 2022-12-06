import 'dart:convert';

import 'package:challenge_01/repo/models/tasks.dart';
import 'package:dio/dio.dart';
import 'package:challenge_01/utils/url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class WebClient {
  final Dio _dio =
      Dio(BaseOptions(connectTimeout: 20000, receiveTimeout: 20000));

  WebClient() {
    _dio.options.baseUrl = ApiUrl.host;
  }

  Future fetchTask() async {
    final response = await _dio.get(ApiUrl.fetchTasks);

    if (response.data == null) {
      return null;
    } else {
      final data = Map<String, dynamic>.from(response.data);
      List<Tasks> taskList = [];
      data.forEach((key, value) {
        taskList.add(Tasks(tasksTitle: value['taskTitle'], id: key));
      });
      return taskList;
    }
  }

  Future addNew(payload) async {
    final response = await _dio.post(ApiUrl.addNewTask, data: payload);
  }

  Future deleteTask(payload) async {
    final response = await _dio.delete("${ApiUrl.deleteTask}/$payload.json");
  }
}
