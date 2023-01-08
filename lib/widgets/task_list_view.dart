import 'package:challenge_01/store/app.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/task/task.actions.dart';
import '../store/task/task.state.dart';
import '../widgets/task_list.dart';
import '../widgets/add_tasks.dart';
import 'package:redux/redux.dart';

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

  loader() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, TasksState>(
        distinct: true,
        converter: (store) => store.state.taskState,
        onInit: (store) {
          store.dispatch(FetchTaskAction());
        },
        builder: (context, viewModel) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
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
                    !viewModel.loading
                        ? viewModel.tasks.isEmpty
                            ? const Expanded(
                                child: Center(
                                  child: Text(
                                    'Please add a task.',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Scrollbar(
                                  radius: const Radius.circular(50),
                                  thumbVisibility: true,
                                  interactive: true,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics(),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    itemCount: viewModel.tasks.length,
                                    itemBuilder: (ctx, index) => TaskList(
                                      id: viewModel.tasks[index].id,
                                      tasks: viewModel.tasks[index].tasksTitle,
                                    ),
                                  ),
                                ),
                              )
                        : loader()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
