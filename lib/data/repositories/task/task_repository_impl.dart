import 'package:todo/core/config/database/app_database.dart';
import 'package:todo/data/models/task/task.dart';
import 'package:todo/domian/entities/task/task.dart';
import 'package:todo/domian/repositories/task/task.dart';

import '../../../core/resources/data_state.dart';

class TaskRepositoryImpl extends TaskRepository {
  final AppDatabase _appDatabase;

  TaskRepositoryImpl(this._appDatabase);

  @override
  Future<DataState> taskCreation(TaskEntity taskEntity) async {
    try {
      await _appDatabase.taskDao.insertTask(taskEntity.toModel());
      return const DataSuccess();
    } catch (e) {
      return const DataFailed();
    }
  }
  
  @override
  Future<DataState> getCreatedTasks() async {
    try {
     var tasks = await _appDatabase.taskDao.getCreatedTasks();
      return DataSuccess(
        data: tasks.map((e) => e.toEntity()).toList()
      );
    } catch (e) {
      return const DataFailed();
    }
  }
  
  @override
  Future<DataState> updateTask(TaskEntity taskEntity) async {
     try {
      var task = taskEntity.toModel();
      task.id = taskEntity.id;
      await _appDatabase.taskDao.updateTask(task);
      return const DataSuccess();
    } catch (e) {
      return const DataFailed();
    }
  }
  
}