import 'package:todo/core/resources/data_state.dart';
import 'package:todo/domian/entities/task/task.dart';
import 'package:todo/domian/repositories/task/task.dart';
import '../../../core/usecase/usecase.dart';

class TaskCreationUseCase implements UseCase<DataState,TaskEntity>{
  
  final TaskRepository _taskRepository;

  TaskCreationUseCase(this._taskRepository);
  
  @override
  Future<DataState> call({TaskEntity? params}) {
    return _taskRepository.taskCreation(params!);
  }
  
}