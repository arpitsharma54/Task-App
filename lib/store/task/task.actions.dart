import '../../repo/models/tasks.dart';

class FetchTaskAction {}

class FetchTaskSuccesAction {
  List<Tasks> newTaskList;
  FetchTaskSuccesAction({required this.newTaskList});
}

class FetchTaskFailedAction {
  String error;
  FetchTaskFailedAction({required this.error});
}

class AddTaskAction {
  final String taskTitle;
  AddTaskAction({required this.taskTitle});
}

class DeleteTaskAction {
  final String id;
  DeleteTaskAction({required this.id});
}

class DeleteTaskSuccessAction {
  List<Tasks> newList;
  DeleteTaskSuccessAction({required this.newList});
}

class DeleteTaskFailedAction {
  String error;
  DeleteTaskFailedAction({required this.error});
}
