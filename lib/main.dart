import 'package:flutter/material.dart';

import 'screens/search_screen.dart';

void main() {
  runApp(const MacroApp());
}

class MacroApp extends StatelessWidget {
  const MacroApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: SearchScreen.id,
      routes: {
        SearchScreen.id: (context) => const SearchScreen(),
      },
    );
  }
}
