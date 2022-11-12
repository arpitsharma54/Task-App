import 'package:challenge_01/repo/web_client/web_client.dart';

class Repositry {
  final WebClient _webClient;
  Repositry({required webClient}) : _webClient = webClient;

  Future fetchTasks() async => _webClient.fetchTask();
  Future addNewTask(payload) async => _webClient.addNew(payload);
  Future deleteTask(payload) async => _webClient.deleteTask(payload);
}
