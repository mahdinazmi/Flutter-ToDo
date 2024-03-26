import 'package:floor/floor.dart';
import 'package:todo/domian/entities/task/task.dart';

@Entity(tableName: 'tasks', primaryKeys: ['id'])
class TaskModel {
  int ? id;
  final String title;
  final String description;
  final String createdDate;
  final String updatedDate;
  final int status;

  TaskModel({
    this.id,
    required this.title,
    required this.createdDate,
    required this.updatedDate,
    required this.status,
    required this.description
  });
}

extension TaskXModel on TaskModel {
  TaskEntity toEntity() {
    return TaskEntity(
      title: title,
      status: status,
      createdDate: createdDate,
      updatedDate: updatedDate,
      description: description,
      id: id
    );
  }
}