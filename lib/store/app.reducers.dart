import 'package:challenge_01/store/app.state.dart';
import 'package:challenge_01/store/task/task.reducers.dart';

AppState allReducers(AppState state, action) =>
    AppState(taskState: taskReducer(state.taskState, action));
