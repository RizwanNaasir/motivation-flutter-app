import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/routes/route_list.dart';
import 'utils/auth.dart';
import 'components/nav_drawer.dart';

void main() {
  runApp(const MyApp());
  Get.put(Auth());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: routes,
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('My	Motivation'),
      ),
      body: const Center(
        child: Text('Side Menu Tutorial'),
      ),
    );
  }
}
