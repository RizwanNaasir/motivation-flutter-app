import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation/components/nav_drawer.dart';
import '../../utils/auth.dart';

class MyFavouriteQoutesPage extends GetView<Auth> {
  const MyFavouriteQoutesPage({Key? key}) : super(key: key);
  static String routeName = "/my-favourite-qoutes";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Auth>(builder: (c) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Favourite Qoutes'),
            elevation: 2,
          ),
          drawer: const NavDrawer(),
          body: const Text('Favourite Qoutes Page'));
    });
  }
}
