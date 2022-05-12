import 'package:challenge_01/widgets/tasks_list_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/tasklist_overview_screen.dart';
import 'screens/signin_screen.dart';
import './screens/signup_screen.dart';

void main() {
  runApp(
   const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge_01',
      home: challengeAppHomePage(),
    );
  }
}

class challengeAppHomePage extends StatefulWidget {
  @override
  State<challengeAppHomePage> createState() => _challengeAppHomePageState();
}

class _challengeAppHomePageState extends State<challengeAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TasksListData(),
        ),
      ],
      child: MaterialApp(
        home: const TasklistOverviewScreen(),
        routes: {
          SignInScreen.routeName: (ctx) => const SignInScreen(),
          TasklistOverviewScreen.routeName: (ctx) =>
              const TasklistOverviewScreen(),
          SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        },
      ),
    );
  }
}
