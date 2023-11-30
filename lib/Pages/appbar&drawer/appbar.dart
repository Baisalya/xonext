import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Xonext'),
      centerTitle: true,
    );
  }
}


class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'user@example.com',
              style: TextStyle(fontSize: 16),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.chat,
              color: Colors.blue,
            ),
            title: Text(
              'New Chat',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Get.toNamed('/chat');
              // Handle New Chat tap
              Navigator.pop(context); // Close the drawer
              // Add your logic to navigate to the new chat screen
            },
            trailing: Icon(Icons.create_outlined),
          ),
          ListTile(
            leading: Icon(
              Icons.history,
              color: Colors.blue,
            ),
            title: Text(
              'Previous Chats',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Handle Previous Chats tap
              Navigator.pop(context); // Close the drawer
              // Add your logic to navigate to the list of previous chats screen
            },
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Handle Settings tap
              Navigator.pop(context); // Close the drawer
              // Add your logic to navigate to the settings screen
            },
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
