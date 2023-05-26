import 'package:flutter/cupertino.dart';
import 'package:motivation/components/drawer/profile.dart';
import 'package:motivation/components/pages/best_qoutes.dart';
import 'package:motivation/components/pages/my_favourite_qoutes.dart';
import 'package:motivation/components/pages/my_home_page.dart';
import '../pages/login.dart';
import '../pages/my_favourite_stories.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/login": (context) => const LoginPage(title: 'Login Page'),
  "/home": (context) => const MyHomePage(),
  "/profile": (context) => const ProfilePage(),
  "/best-quotes": (context) => const BestQoutes(),
  "/my-favourite-qoutes" : (context) => const MyFavouriteQoutesPage(),
  "/my-favourite-stories": (context) => const MyFavouriteStoriesPage()
};
