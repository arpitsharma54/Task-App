import 'package:flutter/cupertino.dart';

class Tasks with ChangeNotifier {
  final String id;
  final String tasksTitle;
  final bool isChecked;

  Tasks({required this.tasksTitle,required this.id, this.isChecked = false});
}
