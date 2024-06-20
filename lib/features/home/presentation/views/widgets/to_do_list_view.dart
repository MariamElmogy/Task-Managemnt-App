import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/utils/app_colors.dart';
import 'package:task_manager_app/features/home/data/models/task_model.dart';
import 'package:task_manager_app/features/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/manager/fetch_task_cubit/fetch_task_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/to_do_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  State<ToDoListView> createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Slidable(
          key: Key(widget.tasks[index].todo),
          endActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () async {
                BlocProvider.of<DeleteTaskCubit>(context)
                    .deleteTask(widget.tasks[index]);
                await BlocProvider.of<FetchTaskCubit>(context).fetchTasks();
              },
            ),
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  BlocProvider.of<DeleteTaskCubit>(context)
                      .deleteTask(widget.tasks[index]);
                  await BlocProvider.of<FetchTaskCubit>(context).fetchTasks();
                },
                backgroundColor: AppColors.purplePlum,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.circular(25),
              ),
            ],
          ),
          child: ToDoItem(
            data: widget.tasks[index],
          ),
        );
      },
    );
  }
}
