import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  const HiveStorage();

  Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<Box<dynamic>> openBox(String boxName) {
    return Hive.openBox<dynamic>(boxName);
  }
}

