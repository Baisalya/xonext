import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('BYANJAN',
      style:TextStyle(color: Colors.white) ,),
      centerTitle: true,
      backgroundColor: Colors.transparent, // Set background color to transparent
      elevation: 4, // Remove the shadow

      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000F3B), // Darker color
              Color(0xFF001F77), // Lighter color
            ],
          ),
        ),
      ),
    );
  }

}



class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
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
                    backgroundImage: AssetImage('assets/Applogo/applogo.png'),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF000F3B), // Darker color
                        Color(0xFF001F77), // Lighter color
                      ],
                    ),
                  ),

                ),

                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.message,
                    color: Color(0xFF000F3B),
                  ),
                  title: Text(
                    'New Chat',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Handle New Chat tap
                    Navigator.pop(context); // Close the drawer
                    // Add your logic to navigate to the new chat screen
                  },
                  trailing: Icon(FontAwesomeIcons.penToSquare,color: Color(0xFF000F3B),),
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.clockRotateLeft,
                    color: Color(0xFF000F3B),
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
                  trailing: Icon(FontAwesomeIcons.arrowRight,color: Color(0xFF000F3B),),
                ),

              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings_applications_sharp,
              color: Color(0xFF000F3B),
            ),
            title: Text(
              'Config',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Handle Settings tap
              Navigator.pop(context); // Close the drawer
              // Add your logic to navigate to the settings screen
            },
            trailing: Icon(FontAwesomeIcons.arrowRight,color: Color(0xFF000F3B),),
          ),
        ],
      ),
    );
  }
}

