import 'package:flutter/material.dart';

import 'ui/posts_list_screen/posts_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aspirity Test',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const MainScreen(title: 'Test App for Aspirity'),
    );
  }
}
