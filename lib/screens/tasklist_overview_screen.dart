import 'package:flutter/material.dart';

import '../widgets/clock_view.dart';
import '../widgets/task_list_view.dart';

class TasklistOverviewScreen extends StatelessWidget {
  static const routeName = '/tasklist-screen';
  const TasklistOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.38,
                width: width * 1,
                color: const Color.fromRGBO(80, 194, 201, 1),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.19,
                    ),
                    const Center(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://www.imagesplatform.com/mohsin_site/uploads/2019_10_09/a9a98243b190f1ba.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome, Oliva Grace',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: -50,
                child: Opacity(
                  opacity: 0.49,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(191, 218, 216, 100),
                    radius: 70,
                  ),
                ),
              ),
              const Positioned(
                left: -50,
                child: Opacity(
                  opacity: 0.49,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(191, 218, 216, 100),
                    radius: 70,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.29,
            child: Stack(
              children: const [
                Positioned(
                  top: 180,
                  left: 18,
                  child: Text(
                    'Tasks List',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Positioned(
                  top: -30,
                  left: 125,
                  child: ClockView(),
                ),
                Positioned(
                  top: 20,
                  right: 18,
                  child: Text(
                    'Good Afternoon',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          TaskListView(),
        ],
      ),
    );
  }
}
