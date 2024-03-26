import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/config/localizations/localizations.dart';
import 'package:todo/core/config/scale/scale.dart';
import 'package:todo/core/config/theme/app_colors.dart';
import 'package:todo/presentation/tasks/bloc/created_tasks_cubit.dart';
import 'package:todo/presentation/tasks/widgets/add_new_task.dart';
import 'package:todo/common/utils/bottom_sheet.dart';
import 'package:todo/common/widgets/buttons/basic_button.dart';
import '../../../common/widgets/appbar/base_app_bar.dart';
import '../widgets/created_tasks.dart';
import '../widgets/not_found_task.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(title: AppLocalizations.of(context)!.translate('home')!,),
      body: SafeArea(
        child: Stack(
          children: [
            _body(context),
            _newTaskCreationButton(context)
          ],
        )
      ),
    );
  }

  Align _newTaskCreationButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: Scale.of(context).moderateScale(20)),
        child: BasicButton(
          title: AppLocalizations.of(context)!.translate('create_new_task')!,
          onPressed: () {
            AppBottomSheet.display(context: context, widget: AddNewTask());
          }
        ),
      )
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<CreatedTasksCubit,CreatedTasksState> (
      builder: (context,state) {
        if (state is TasksLoaded) {
          return state.tasks!.isEmpty ? const NotFoundTask() : CreatedTasks(tasks : state.tasks!);
        }
        return const SizedBox();
      },
    );
  }
}