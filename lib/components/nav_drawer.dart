import 'package:flutter/material.dart';
import 'package:motivation/components/pages/profile.dart';
import 'package:motivation/components/pages/best_qoutes.dart';
import 'package:motivation/components/pages/my_favourite_qoutes.dart';
import 'package:motivation/components/pages/my_favourite_stories.dart';
import 'package:motivation/components/pages/my_home_page.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  void redirect(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
          (route) => false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('General Hux'),
            accountEmail: Text('spacehitler@stardestroyer.com'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => redirect(context, MyHomePage.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => redirect(context, ProfilePage.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Best Quotes'),
            onTap: () => redirect(context, BestQoutes.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.label_important),
            title: const Text('My Favorite Quotes'),
            onTap: () => redirect(context, MyFavouriteQoutesPage.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.poll_sharp),
            title: const Text('My Favourite Stories'),
            onTap: () => redirect(context, MyFavouriteStoriesPage.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}