import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/packages/persian_number_utility/src/extensions.dart';
import 'package:todo/domian/entities/task/task.dart';

import '../../../common/utils/bottom_sheet.dart';
import '../../../core/config/scale/scale.dart';
import '../../../core/config/style/style.dart';
import '../../../core/config/theme/app_colors.dart';
import '../bloc/created_tasks_cubit.dart';
import 'edit_created_task.dart';

class CreatedTasks extends StatelessWidget {
  final List<TaskEntity> tasks;
  const CreatedTasks({required this.tasks,super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        bottom: Scale.of(context).moderateScale(100),
        top: Scale.of(context).moderateScale(16),
        right: Scale.of(context).moderateScale(16),
        left: Scale.of(context).moderateScale(16),
      ),
      itemBuilder: (context, index) {
        var task = tasks[index];
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(context: context, widget: EditCreatedTask(taskEntity: task, ));
          },
          child: Container(
            padding: AppSpace(context).allSide16(),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.all14(),
              color: AppColors.darkGrey
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSize(context).size16(),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: Scale.of(context).moderateScale(10), ),
                    Text(
                      task.description,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSize(context).size12(),
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: Scale.of(context).moderateScale(20), ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.white,
                          size: AppFontSize(context).size14(),
                        ),
                        Text(
                          ' ${task.createdDate.toPersianDate()}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppFontSize(context).size10()
                          ),
                        )
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CreatedTasksCubit>().changingTaskStatus(task);
                  },
                  child: Container(
                    height: Scale.of(context).moderateScale(25),
                    width: Scale.of(context).moderateScale(25),
                    decoration: BoxDecoration(
                      color: task.status == 0 ? Colors.transparent : AppColors.green,
                      shape: BoxShape.circle,
                      border: task.status == 0 ? 
                      Border.all(color: AppColors.white,width: 1)
                      : Border.all(width: 0)
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: Scale.of(context).moderateScale(10), ),
      itemCount: tasks.length
    );
  }
}