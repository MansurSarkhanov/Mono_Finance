import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxsManager {
  Future<void> saveData({required String boxName, required String key, required value}) async {
    var box = await Hive.openBox(boxName);
    box.put(key, value);
  }

  Future<bool?> readDataBool({required String boxName, required String key}) async {
    var box = await Hive.openBox(boxName);
    return box.get(key);
  }
  Future<String?> readDataString({required String boxName, required String key}) async {
    var box = await Hive.openBox(boxName);
    return box.get(key);
  }
  Future<void> deleteData({required String boxName, required String key}) async {
    var box = await Hive.openBox(boxName);
    return box.delete(key);
  }
}
