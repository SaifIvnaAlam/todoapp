import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';

class InitializeHive {
  static Future<void> init() async {
    await Hive.initFlutter();
    await registerAdapters();
    await openBox();
  }

  static Future<void> registerAdapters() async {
    Hive.registerAdapter(ToDoModelAdapter());
  }

  static Future<void> openBox() async {
    await Hive.openBox<ToDoModel>('todos');
  }
}
