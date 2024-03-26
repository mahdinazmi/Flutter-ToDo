part of 'perform_operation_cubit.dart';

abstract class PerformOperationState {}

class PerformOperationInitialState extends PerformOperationState {}

class OperationWasSuccessful extends PerformOperationState {
  final dynamic result;

  OperationWasSuccessful({required this.result});
}

class OperationWasUnSuccessful extends PerformOperationState {}

class WaitingToFinishOperation extends PerformOperationState {}
