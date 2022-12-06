import 'package:challenge_01/store/app.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../store/task/task.actions.dart';
import '../store/task/task.state.dart';
import '../widgets/task_list.dart';
import '../widgets/add_tasks.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  void _addTasks(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (context) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          behavior: HitTestBehavior.opaque,
          child: const AddTasks(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.create(store, context),
      onInit: (store) {
        store.dispatch(FetchTaskAction());
      },
      builder: (context, viewModel) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        child: Column(
          children: [
            // SizedBox(height: 10,),
            Container(
              width: width * 0.88,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Center(
                      child: Text(
                        'Tasks List',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(0, 0, 0, 0.80),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () => _addTasks(context),
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Color.fromRGBO(45, 143, 149, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.88,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              height: height * 0.24,
              child: viewModel.tasksState.tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'Please add a task.',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  : Scrollbar(
                      radius: const Radius.circular(50),
                      thumbVisibility: true,
                      interactive: true,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: viewModel.tasksState.tasks.length,
                        itemBuilder: (ctx, index) => TaskList(
                          id: viewModel.tasksState.tasks[index].id,
                          tasks: viewModel.tasksState.tasks[index].tasksTitle,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  final TasksState tasksState;

  _ViewModel({required this.tasksState});

  factory _ViewModel.create(Store<AppState> store, BuildContext context) {
    return _ViewModel(
      tasksState: store.state.taskState,
    );
  }
}
