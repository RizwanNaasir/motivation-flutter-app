
import 'package:flutter/material.dart';
import 'package:motivation/components/nav_drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}