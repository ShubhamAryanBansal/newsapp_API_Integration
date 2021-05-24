import 'package:hello_app/Modal/APIClient.dart';

class SharedData {
  static final SharedData shared = SharedData._internal();
  factory SharedData() {
    return shared;
  }
  SharedData._internal();
  List<APIClient> fetchjson;
}