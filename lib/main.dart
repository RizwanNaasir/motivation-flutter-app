import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/pages/my_home_page.dart';
import 'components/routes/route_list.dart';
import 'utils/auth.dart';

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
