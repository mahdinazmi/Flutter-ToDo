import 'package:todo/core/resources/data_state.dart';
import 'package:todo/domian/repositories/task/task.dart';
import '../../../core/usecase/usecase.dart';

class GetCreatedTasksUseCase implements UseCase<DataState,void>{
  
  final TaskRepository _taskRepository;

  GetCreatedTasksUseCase(this._taskRepository);
  
  @override
  Future<DataState> call({void params}) async {
    return await _taskRepository.getCreatedTasks();
  }
  
}