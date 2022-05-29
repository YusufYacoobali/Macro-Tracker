import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimSearchBar(
            width: 400,
            textController: textController,
            onSuffixTap: () {
              print(textController.text);
              print(textController.value);
              setState(() {
                //textController.clear();
              });
            }));
  }
}
