import 'package:hive/hive.dart';

class CachHelper {
  static late Box box;

  Future putData({required String key, required String value}) async {
    await box.put(key, value);
  }

  dynamic getData({required String key}) async {
    return box.get(key);
  }

  dynamic deleteData({required String key}) async {
    return box.delete(key);
  }

  dynamic clearBox({required String key}) async {
    return box.clear();
  }
}
