// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          50.h.heightBox,
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: Text('Favorites'),
            leading: Icon(Icons.account_balance_outlined),
            onTap: () {},
          ),
          ListTile(
            title: Text('Share'),
            leading: Icon(Icons.phone),
            onTap: () {},
          ),
          ListTile(
            title: Text('Rating'),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.privacy_tip_outlined),
            onTap: () {},
          ),
          ListTile(
            title: Text('Pictures'),
            leading: Icon(Icons.logout),
            onTap: () {},
          ),
          ListTile(
            title: Text('Categories'),
            leading: Icon(Icons.logout),
            onTap: () {},
          ),
          ListTile(
            title: Text('Notifications'),
            leading: Icon(Icons.logout),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            leading: Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
