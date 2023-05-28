import 'package:flutter/material.dart';
import 'package:motivation/components/nav_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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