import '../widgets/tasks_list_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {
              setState(() {
                ischecked = true;
              });
            },
            icon: ischecked
                ? const Icon(Icons.check_box_outlined)
                : const Icon(Icons.check_box_outline_blank),
            constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
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
              onPressed: () {
                Provider.of<TasksListData>(context, listen: false)
                    .deletTasks(widget.id);
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
    );
  }
}
