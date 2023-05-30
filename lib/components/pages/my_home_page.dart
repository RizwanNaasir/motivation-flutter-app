import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/Models/daily_quotes.dart';
import 'package:shimmer/shimmer.dart';
import '../nav_drawer.dart';

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
                : ListView.builder(
          itemCount: dailyQuotes.length,
          itemBuilder: (context, i) {
            return Card(
              // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // Set the elevation to 3
              elevation: 4,
              // Set the clip behavior of the card
              clipBehavior: Clip.antiAliasWithSaveLayer,
              // Define the child widgets of the card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                  // Add a container with padding that contains the card's title, text, and buttons
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Display the card's title using a font size of 24 and a dark grey color
                        Text(
                          dailyQuotes[i].content.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ),
                        ),
                        // Add a space between the title and the text
                        Container(height: 10),
                        // Display the card's text using a font size of 15 and a light grey color
                        Text(
                          dailyQuotes[i].author.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        // Add a row with two buttons spaced apart and aligned to the right side of the card
                        Row(
                          children: <Widget>[
                            // Add a spacer to push the buttons to the right side of the card
                            const Spacer(),
                            IconButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              icon: Icon(
                                Icons.favorite,
                                color: (dailyQuotes[i].isLiked!)
                                    ? Colors.red
                                    : grey,
                                size: 24.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              onPressed: () {
                                setState(() {
                                  dailyQuotes[i].isLiked =
                                      !dailyQuotes[i].isLiked!;
                                });
                              },
                            ),
                            // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Add a small space between the card and the next widget
                  Container(height: 5),
                ],
              ),
            );
          },
        )),
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
        highlightColor: const Color(0xFFB0B0B0), // Color of the shimmer highlight
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
