import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget cardList(BuildContext context, List<dynamic> listItems,
    Function setState, bool isLoading) {
  return isLoading
      ? _buildLoadingShimmer()
      : ListView.builder(
          itemCount: listItems.length,
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
                          listItems[i].content.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ),
                        ),
                        // Add a space between the title and the text
                        Container(height: 10),
                        // Display the card's text using a font size of 15 and a light grey color
                        Text(
                          listItems[i].author.toString(),
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
                                color: (listItems[i].isLiked!)
                                    ? Colors.red
                                    : Colors.grey,
                                size: 24.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              onPressed: () {
                                setState(() {
                                  listItems[i].isLiked = !listItems[i].isLiked!;
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
        );
}

Widget _buildLoadingShimmer() {
  return ListView.builder(
    itemCount: 6, // Number of shimmer placeholders to show
    itemBuilder: (context, i) {
      return Shimmer.fromColors(
        baseColor: const Color(0xFFE3E3E3), // Color of the shimmer base color
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
                  height: 42, // Height of the shimmer placeholder
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
