import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/tasks_list_data.dart';
import '../widgets/task_list.dart';
import '../widgets/add_tasks.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  bool _isLoading = false;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TasksListData>(context, listen: false)
          .fetchAndSetProducts()
          .then((_) {
        setState(() {
          _isLoading = false;
          _isInit = false;
        });
      });
    }

    super.didChangeDependencies();
  }

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
    final taskData = Provider.of<TasksListData>(context);
    final tasks = taskData.tasks;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
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
            padding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
            height: height * 0.24,
            child: tasks.isEmpty
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
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      itemCount: tasks.length,
                      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                        value: tasks[index],
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : TaskList(
                                id: tasks[index].id,
                                tasks: tasks[index].tasksTitle,
                              ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
