import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxsManager {
  Future<void> saveData({required String boxName, required String key, required value}) async {
    var box = await Hive.openBox(boxName);
    box.put(key, value);
  }

  readData({required String boxName, required String key}) async {
    var box = await Hive.openBox(boxName);
    return box.get(key);
  }
}
