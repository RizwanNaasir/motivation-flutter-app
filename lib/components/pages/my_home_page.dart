import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motivation/Models/daily_quotes.dart';

import '../nav_drawer.dart';
import '../widgets/card_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const String routeName = '/home';

  @override
  State<MyHomePage> createState() => _MainState();
}

class _MainState extends State<MyHomePage> {
  final grey = Colors.blueGrey[800];
  bool isLoading = true;
  List<DailyQuotes> dailyQuotes = [];

  @override
  void initState() {
    super.initState();
    getQuote();
  }

  // get a random Quote from the API
  getQuote() async {
    await http
        .get(Uri.parse('https://api.quotable.io/quotes/random?limit=5'))
        .then((value) {
      if (value.statusCode == 200) {
        List<dynamic> json = jsonDecode(value.body);
        for (var i = 0; i < json.length; i++) {
          setState(() {
            dailyQuotes.add(DailyQuotes.fromJson(json[i]));
          });
        }
        setState(() {
          isLoading = false;
        });
      } else {
        log('Error in loading data: ${value.statusCode}');
      }
    });
  }

  // Main build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Center(
            child: cardList(context, dailyQuotes, setState,
                isLoading) // Build the list of quotes
            ), // Show the list of quotes
      ),
    );
  }
}
