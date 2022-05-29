import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  List foodList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              //controller: textController,
              onSubmitted: (text) {
                foodList.clear();
                foodData(text);
                foodList.clear();
              },
            ),
            foodList.isEmpty
                ? const Text("No results found")
                : Expanded(
                    child: ListView.builder(
                        itemCount: foodList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(foodList[index]["lowercaseDescription"]),
                            //kcal (not sure on portion size)=3, 0 = protein
                            subtitle: Text(foodList[index]["foodNutrients"][0]
                                    ["value"]
                                .toString()),
                          );
                          ;
                        }),
                  )
          ],
        ),
      ),
    ));
  }

  foodData(text) async {
    String query = text;

    if (text.indexOf(' ') > 0) {
      query = text.replaceAll(' ', '%20');
    }

    print(query);

    //using own api key
    final response = await http.get(Uri.parse(
        'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=tfBwCq9vhXCUm6Gsdb9haTW6CjAhqXri8Lg0P2Um&query=$query'));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      print(jsonResponse['foods'].length); //length of 1 page = 50
      //foodList.clear();

      setState(() {
        foodList.addAll(jsonResponse['foods']);
      });

      print(foodList);
      //each food has a food num and food nutritents, food nutrients has nutrientid/name + amount for each nutrient
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
