import 'package:todo/data/models/task/task.dart';

class TaskEntity {
  final int ? id;
  final String title;
  final String description;
  final String createdDate;
  String updatedDate;
  int status;

  TaskEntity({
    this.id,
    required this.title,
    required this.description,
    required this.createdDate,
    required this.updatedDate,
    required this.status
  });

}

extension TaskXEntity on TaskEntity {
  TaskModel toModel() {
    return TaskModel(
      title: title,
      status: status,
      createdDate: createdDate,
      updatedDate: updatedDate,
      description: description,
    );
  }
}