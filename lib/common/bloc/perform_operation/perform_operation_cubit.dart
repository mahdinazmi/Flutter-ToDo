import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';

part 'perform_operation_state.dart';

class PerformOperationCubit extends Cubit < PerformOperationState > {
  final UseCase _useCase;
  dynamic result;
  PerformOperationCubit(this._useCase): super(PerformOperationInitialState());

  void performOperation({dynamic params}) async {
    emit(WaitingToFinishOperation());
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      result = await _useCase.call(params: params);
      if (result is DataSuccess) {
        emit(
          OperationWasSuccessful(
            result: result.data
          )
        );
        await Future.delayed(const Duration(milliseconds: 600));
      } else {
        emit(
          OperationWasUnSuccessful()
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(
        OperationWasUnSuccessful()
      );
    }
  }
}
