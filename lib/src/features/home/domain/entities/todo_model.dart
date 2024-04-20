import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0) // Add HiveType annotation and typeId
class ToDoModel {
  @HiveField(0) // Add HiveField annotation for each field
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String? createdAt;

  @HiveField(4)
  String? completedAt;

  @HiveField(5)
  bool isDone;

  ToDoModel({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
    this.completedAt,
    required this.isDone,
  });

  // Add a factory method to generate a ToDoModel instance from a Hive box
  factory ToDoModel.fromHive(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      createdAt: map['createdAt'],
      completedAt: map['completedAt'],
      isDone: map['isDone'],
    );
  }

  // Add a method to convert a ToDoModel instance to a Map for storing in Hive
  Map<String, dynamic> toHive() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'completedAt': completedAt,
      'isDone': isDone,
    };
  }
}
