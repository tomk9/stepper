import 'package:flutter/services.dart';

Future<String> loadAsset(String key) async {
  return await rootBundle.loadString(key);
}
