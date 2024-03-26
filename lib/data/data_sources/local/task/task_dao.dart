import 'package:floor/floor.dart';
import 'package:todo/data/models/task/task.dart';

@dao
abstract class TaskDao {
  
  @Insert()
  Future<void> insertTask(TaskModel task);

  @Update()
  Future<void> updateTask(TaskModel task);

  @Query('SELECT * FROM tasks')
  Future<List<TaskModel>> getCreatedTasks();

}