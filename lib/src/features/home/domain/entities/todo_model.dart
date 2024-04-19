import 'dart:convert';

class ToDoModel {
  String id;
  String title;
  String description;
  String? createdAt;
  String? completedAt;
  bool isDone = false;
  ToDoModel({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
    this.completedAt,
    required this.isDone,
  });

  ToDoModel copyWith({
    String? id,
    String? title,
    String? description,
    String? createdAt,
    String? completedAt,
    bool? isDone,
  }) {
    return ToDoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (completedAt != null) {
      result.addAll({'completedAt': completedAt});
    }
    result.addAll({'isDone': isDone});

    return result;
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['createdAt'],
      completedAt: map['completedAt'],
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ToDoModel(id: $id, title: $title, description: $description, createdAt: $createdAt, completedAt: $completedAt, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToDoModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.completedAt == completedAt &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        completedAt.hashCode ^
        isDone.hashCode;
  }
}
