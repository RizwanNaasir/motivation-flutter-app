
import 'package:flutter/material.dart';
import 'package:motivation/components/nav_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My	Motivation'),
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}