import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/auth.dart';
import '../nav_drawer.dart';

class MyFavouriteStoriesPage extends GetView<Auth> {
  const MyFavouriteStoriesPage({Key? key}) : super(key: key);
  static String routeName = "/my-favourite-stories";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Auth>(builder: (c) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Favourite Stories'),
            elevation: 2,
          ),
          drawer: const NavDrawer(),
          body: const Text('Favourite Stories Page'));
    });
  }
}
