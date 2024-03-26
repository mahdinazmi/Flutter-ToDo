import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domian/usecases/task/get_created_tasks.dart';
import 'package:todo/domian/usecases/task/task_updating.dart';
import 'package:todo/service_locator.dart';
import '../../../core/resources/data_state.dart';
import '../../../domian/entities/task/task.dart';
import 'package:equatable/equatable.dart';
part 'created_tasks_state.dart';

class CreatedTasksCubit extends Cubit < CreatedTasksState > {

  CreatedTasksCubit(): super(TasksLoading());

  void getCreatedTasks() async {
    try {
      var results = await sl < GetCreatedTasksUseCase > ().call();
      if (results is DataSuccess) {
        emit(TasksLoaded(tasks: results.data));
      } else {
        throw Exception();
      }
    } catch (e) {
      emit(TasksLoadFailure());
    }
  }

  void changingTaskStatus(TaskEntity taskEntity) async {
    try {
      taskEntity.status == 0 ? taskEntity.status = 1 : taskEntity.status = 0;
      taskEntity.updatedDate = DateTime.now().toString();
      await sl<TaskUpdatingUseCase>().call(params: taskEntity);
      var results = await sl < GetCreatedTasksUseCase > ().call();
      emit(TasksLoaded(tasks: results.data));
    } catch (e) {
      emit(TasksLoadFailure());
    }
  }
  }
