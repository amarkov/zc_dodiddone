import 'package:flutter/material.dart';
import 'package:zc_dodiddone/widgets/task_item.dart';


class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<String> _tasks = [
    'Купить продукты',
    'Записаться на тренировку',
    'Отправить отчет',
    'Позвонить другу',
    'Сделать уборку',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          title: _tasks[index], 
          description: 'Описание задачи', 
          deadline: DateTime.now(),
        );
      },
    );
  }
}
