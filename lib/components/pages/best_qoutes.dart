import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation/components/nav_drawer.dart';
import '../../utils/auth.dart';

class BestQoutes extends GetView<Auth> {
  const BestQoutes({Key? key}) : super(key: key);
  static String routeName = "/best-quotes";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Auth>(builder: (c) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Best Qoutes'),
            elevation: 2,
          ),
          drawer: const NavDrawer(),
          body: const Text('Best Qoutes Page'));
    });
  }
}
