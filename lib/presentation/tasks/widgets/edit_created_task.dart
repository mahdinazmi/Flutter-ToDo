import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/config/scale/scale.dart';
import 'package:todo/core/config/theme/app_colors.dart';
import 'package:todo/domian/entities/task/task.dart';
import 'package:todo/presentation/tasks/bloc/created_tasks_cubit.dart';

import '../../../core/config/localizations/localizations.dart';
import '../../../core/config/style/style.dart';
import '../../../domian/usecases/task/task_updating.dart';
import '../../../service_locator.dart';
import '../../../common/bloc/perform_operation/perform_operation_cubit.dart';
import '../../../common/widgets/dialog/progress_dialog.dart';
import '../../../common/widgets/widgets.dart';

class EditCreatedTask extends StatefulWidget {
  final TaskEntity taskEntity;
  const EditCreatedTask({super.key, required this.taskEntity});

  @override
  State<EditCreatedTask> createState() => _EditCreatedTaskState();
}

class _EditCreatedTaskState extends State<EditCreatedTask> {
  final PerformOperationCubit _performOperationCubit = PerformOperationCubit(sl<TaskUpdatingUseCase>());
  final TextEditingController _titleFieldController = TextEditingController();
  final TextEditingController _descriptionFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleFieldController.text = widget.taskEntity.title;
    _descriptionFieldController.text = widget.taskEntity.description;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener < PerformOperationCubit, PerformOperationState > (
      bloc: _performOperationCubit,
      listener: (context, state) {
        if (state is WaitingToFinishOperation) {
          ProgressDialog.displayDialog(context);
        }
        if (state is OperationWasUnSuccessful) {
          ProgressDialog.hideDialog(context);
        }
        if (state is OperationWasSuccessful) {
          ProgressDialog.hideDialog(context);
          Navigator.pop(context);
          BlocProvider.of<CreatedTasksCubit>(context).getCreatedTasks();
        }
      },
        child: Padding(
          padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
         ),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            padding: AppSpace(context).allSide16(),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.trtl25(),
              color: AppColors.secondary
            ),
            child: Column(
              children: [
                _taskTitle(context),
                SizedBox(
                  height: Scale.of(context).moderateScale(30),
                ),
                _taskDescription(context),
                const Spacer(),
                _taskCreationButton(context)
              ],
            ),
          ),
        )
    );
  }

  Widget _taskTitle(BuildContext context) {
    return TextField(
      controller: _titleFieldController,
      onChanged: (value){
        _titleFieldController.text = value;
      },
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: AppFontSize(context).size16(),
      ),
      decoration: AppTextField(context).appTextFieldDecoration().copyWith(
        contentPadding: AppSpace(context).allSide12(),
        helperStyle: const TextStyle(color: Colors.white),
        hintText: AppLocalizations.of(context)!.translate('task_title')!
      ),
    );
  }

  Widget _taskDescription(BuildContext context) {
    return TextField(
      controller: _descriptionFieldController,
      minLines: 5,
      maxLines: 6,
      onChanged: (value){
        _descriptionFieldController.text = value;
      },
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: AppFontSize(context).size16(),
      ),
      decoration: AppTextField(context).appTextFieldDecoration().copyWith(
        contentPadding: AppSpace(context).allSide12(),
        helperStyle: const TextStyle(color: Colors.white),
        hintText: AppLocalizations.of(context)!.translate('description')!
      ),
    );
  }

  Widget _taskCreationButton(BuildContext context) {
    return BasicButton(
      title: AppLocalizations.of(context)!.translate('edit_task')!,
      width: MediaQuery.of(context).size.width,
      onPressed: () {
        _performOperationCubit.performOperation(
          params: TaskEntity(
            title: _titleFieldController.text,
            description: _descriptionFieldController.text,
            createdDate: DateTime.tryParse(widget.taskEntity.createdDate).toString(),
            updatedDate: DateTime.now().toString(),
            status: widget.taskEntity.status,
            id: widget.taskEntity.id
          )
        );
      }
    );
  }
}