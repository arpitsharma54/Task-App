import 'package:challenge_01/repo/models/tasks.dart';
import 'package:challenge_01/store/app.state.dart';
import 'package:challenge_01/store/task/task.actions.dart';
import 'package:challenge_01/store/task/task.middleware.dart';
import 'package:challenge_01/store/task/task.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class TaskList extends StatefulWidget {
  final String tasks;
  final String id;

  TaskList({
    required this.id,
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool ischecked = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.create(store, context),
      builder: (context, viewModel) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Checkbox(
              value: ischecked,
              onChanged: (value) {
                setState(() {
                  ischecked = !ischecked;
                });
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 6,
            child: Text(
              widget.tasks,
              style: GoogleFonts.getFont('Poppins'),
            ),
          ),
          if (ischecked)
            Expanded(
              flex: 1,
              child: IconButton(
                splashRadius: 0.01,
                onPressed: () {
                  viewModel.deleteTask(widget.id);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text(
                        'Task Removed.',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}

class _ViewModel {
  final TasksState tasksState;
  final Function deleteTask;

  _ViewModel({required this.tasksState, required this.deleteTask});

  factory _ViewModel.create(Store<AppState> store, BuildContext context) {
    deleteTask(String id) => store.dispatch(DeleteTaskAction(id: id));
    return _ViewModel(
      tasksState: store.state.taskState,
      deleteTask: deleteTask,
    );
  }
}
