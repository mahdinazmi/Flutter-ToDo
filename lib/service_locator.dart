import 'package:todo/data/repositories/task/task_repository_impl.dart';
import 'package:todo/domian/repositories/task/task.dart';
import 'package:todo/domian/usecases/task/get_created_tasks.dart';
import 'package:todo/domian/usecases/task/task_creation.dart';
import 'package:todo/domian/usecases/task/task_updating.dart';
import 'core/config/database/app_database.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  
  // Database
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  
  // Repositories
  sl.registerSingleton < TaskRepository > (
    TaskRepositoryImpl(sl())
  );

  // UseCases
  sl.registerSingleton<TaskCreationUseCase>(
    TaskCreationUseCase(sl())
  );

  sl.registerSingleton<GetCreatedTasksUseCase>(
    GetCreatedTasksUseCase(sl())
  );

  sl.registerSingleton<TaskUpdatingUseCase>(
    TaskUpdatingUseCase(sl())
  );
  
}