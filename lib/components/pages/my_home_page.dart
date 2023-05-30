import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motivation/Models/daily_quotes.dart';
import 'package:shimmer/shimmer.dart';

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
  bool isLoading = false;
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
        isLoading = false;
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
            child: isLoading
                ? _buildLoadingShimmer() // Show shimmer effect while loading
                : cardList(
                    context, dailyQuotes, setState) // Show the list of quotes
            ), // Show the list of quotes
      ),
    );
  }
}

Widget _buildLoadingShimmer() {
  return ListView.builder(
    itemCount: 5, // Number of shimmer placeholders to show
    itemBuilder: (context, i) {
      return Shimmer.fromColors(
        baseColor: const Color(0xFF808080), // Color of the shimmer base color
        highlightColor:
            const Color(0xFFB0B0B0), // Color of the shimmer highlight
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 12, // Height of the shimmer placeholder
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 10, // Height of the shimmer placeholder
                  width: 200, // Width of the shimmer placeholder
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 10, // Height of the shimmer placeholder
                  width: 150, // Width of the shimmer placeholder
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
