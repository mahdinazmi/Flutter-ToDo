part of 'created_tasks_cubit.dart';

abstract class CreatedTasksState  extends Equatable {
  final List<TaskEntity> ? tasks;

  const CreatedTasksState({this.tasks});

  @override
  List<Object> get props => [tasks!]; 
  
  }


class TasksLoading extends CreatedTasksState {}

class TasksLoaded extends CreatedTasksState {
  const TasksLoaded({required List<TaskEntity> tasks}) : super(tasks: tasks);
}

class TasksLoadFailure extends CreatedTasksState {}