import 'package:cat_facts/presentation/main_screen/cat_screen.dart';
import 'package:cat_facts/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  setupServiceLocator();
  runApp(const MaterialApp(home: CatScreen()));
}
