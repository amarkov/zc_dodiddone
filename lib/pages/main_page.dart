import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zc_dodiddone/screens/all_tasks.dart';
import '../theme/theme.dart';
import '../screens/profile.dart'; // Импортируем profile.dart
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart'; // Импортируем пакет для DateTimePicker

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TasksPage(),
    Text('Сегодня'),
    ProfilePage(), // Заменяем Text на ProfilePage
    Text('Выполнено'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showAddTaskDialog() {
    // Создаем контроллеры для полей ввода
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _deadlineController = TextEditingController();
    DateTime? _selectedDate; // Переменная для хранения выбранной даты

    // Покажем диалог
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить задачу'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Описание'),
              ),
              DateTimeField(
                controller: _deadlineController,
                format: DateFormat('dd.MM.yy HH:mm'), // Формат даты и времени
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    initialDate: currentValue ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  ).then((date) {
                    if (date != null) {
                      return showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      ).then((time) {
                        return DateTimeField.combine(date, time);
                      });
                    } else {
                      return currentValue;
                    }
                  });
                },
                onChanged: (date) {
                  _selectedDate = date; // Обновляем выбранную дату
                },
                decoration: const InputDecoration(labelText: 'Дедлайн'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                // Получаем данные из контроллеров
                String title = _titleController.text;
                String description = _descriptionController.text;
                DateTime deadline = _selectedDate ?? DateTime.now(); // Используем выбранную дату

                // Передаем данные на страницу задач
                Navigator.pushNamed(context, '/tasks', arguments: {
                  'title': title,
                  'description': description,
                  'deadline': deadline,
                });

                // Закрываем диалог
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Прозрачный AppBar
        elevation: 0, // Убираем тень
      ),
      body: Container( // Добавляем Container для градиента
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              DoDidDoneTheme.lightTheme.colorScheme.primary,
              DoDidDoneTheme.lightTheme.colorScheme.secondary,
            ],
            stops: const [0.1, 0.9], // Основной цвет занимает 90%
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Прозрачный BottomNavigationBar
        elevation: 0, // Убираем тень
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
