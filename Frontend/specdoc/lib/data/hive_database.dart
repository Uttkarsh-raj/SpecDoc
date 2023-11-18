import 'package:hive_flutter/adapters.dart';

class HiveDatabase {
  final _myDb = Hive.box("specdoc");
  void saveData(List<String> categories, List<String> desc) {
    _myDb.put("cats", categories);
    _myDb.put("desc", desc);
    print(_myDb.get("cats"));
    print(_myDb.get('desc'));
  }

  List<String> getCategories() {
    return _myDb.get("cats") ?? [];
  }

  List<String> getDesc() {
    return _myDb.get('desc') ?? [];
  }
}
