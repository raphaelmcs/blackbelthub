import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/app_state.dart';
import 'screens/login_screen.dart';
import 'screens/main_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BlackBeltHubApp());
}

class BlackBeltHubApp extends StatelessWidget {
  const BlackBeltHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'BlackBeltHub',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark(),
        initialRoute: '/login',
        routes: {
          '/login': (_) => const LoginScreen(),
          '/main': (_) => const MainShell(),
        },
      ),
    );
  }
}
