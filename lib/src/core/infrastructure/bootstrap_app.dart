import 'package:flutter/material.dart';
import 'package:todoapp/src/core/infrastructure/hive_init.dart';

Future<void> bootstrapApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeHive.init();
}
