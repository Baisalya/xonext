import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'drawertab/usersetting.dart';

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
  final TabController tabController;

  CustomDrawer({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Your Name'),
            accountEmail: Text('your.email@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/Applogo/applogo.png'),
            ),
          ),
          DefaultTabController(
            length: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(text: 'Tab 1'),
                        Tab(text: 'Tab 2'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.width, // Adjust the height as needed
                    child: TabBarView(
                      controller: tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Usersetting(),
                        Center(child: Text('Tab 2 Content')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

