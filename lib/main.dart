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
      initialRoute: SearchScreen.id,
      routes: {
        SearchScreen.id: (context) => const SearchScreen(),
      },
    );
  }
}

//check if text string has space, put %20 in between words
//if no results, show nothing showed up/add new food button (does nothing for now)
// make food object so it can easily be shown
//start on main page, statistics