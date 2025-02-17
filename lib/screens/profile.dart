import 'package:flutter/material.dart';
import 'package:zc_dodiddone/pages/login_page_.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  bool isEmailVerified = false; // Флаг для проверки подтверждения почты
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Аватар
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/_1.png'), // Замените на реальный путь к аватару
          ),
          const SizedBox(height: 20),
          // Почта
          const Text(
            'example@email.com', // Замените на реальную почту пользователя
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          // Кнопка подтверждения почты (отображается, если почта не подтверждена)
          if (!isEmailVerified)
            ElevatedButton(
              onPressed: () {
                // Обработка отправки запроса подтверждения почты
                // Например, можно показать диалог с сообщением о том, что письмо отправлено
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Подтверждение почты'),
                    content: const Text(
                        'Письмо с подтверждением отправлено на ваш адрес.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 54, 67, 244), // Голубой цвет для кнопки выхода
                textStyle: const TextStyle(color: Colors.white), // Текст кнопок белый
              ),
              child: const Text('Подтвердить почту'),
            ),
          const SizedBox(height: 20),
          // Кнопка выхода из профиля
          ElevatedButton(
            onPressed: () {
              // Обработка выхода из профиля
              // Например, можно перейти на страницу входа
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Красный цвет для кнопки выхода
              textStyle: const TextStyle(color: Colors.white), // Текст кнопок белый
            ),
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }
}
