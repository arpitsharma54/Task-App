import 'package:challenge_01/repo/repositry.dart';
import 'package:challenge_01/repo/web_client/web_client.dart';
import 'package:challenge_01/store/app.middleware.dart';
import 'package:challenge_01/store/app.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './screens/tasklist_overview_screen.dart';
import 'screens/signin_screen.dart';
import './screens/signup_screen.dart';
import 'package:redux/redux.dart';

import 'store/app.reducers.dart';

void main() {
  WebClient _webClient = WebClient();
  var store = Store<AppState>(
    allReducers,
    distinct: true,
    initialState: AppState.initial(),
    middleware: [
      ...appMiddleware(
        Repositry(webClient: _webClient),
      ),
    ],
  );
  runApp(
    StoreProvider(store: store, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge_01',
      home: challengeAppHomePage(),
      builder: EasyLoading.init(),
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
    return MaterialApp(
      home: const TasklistOverviewScreen(),
      routes: {
        SignInScreen.routeName: (ctx) => const SignInScreen(),
        TasklistOverviewScreen.routeName: (ctx) =>
            const TasklistOverviewScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
      },
    );
  }
}
