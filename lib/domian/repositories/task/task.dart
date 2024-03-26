import 'package:todo/core/resources/data_state.dart';
import 'package:todo/domian/entities/task/task.dart';

abstract class TaskRepository{

  Future < DataState > taskCreation(TaskEntity taskEntity);

  Future < DataState > updateTask(TaskEntity taskEntity);

  Future < DataState > getCreatedTasks();

}