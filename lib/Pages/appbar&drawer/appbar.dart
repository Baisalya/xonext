import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:xonext/utils/AppTheme.dart';

import 'drawertab/settings.dart';
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
      child: SafeArea(
        child: Column(
          children: [
        Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/Applogo/applogo.png'),
              radius: 25.0,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                // Handle back button press
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
    ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,0,10,0),
              child: Divider(
                color: AppTheme.dividercolor(context),
                thickness: 2,
              ),
            ),
            SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children: [
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
                                RotatedBox(
                                  quarterTurns:1,
                                  child: Tab(
                                    icon: Image.asset('assets/setting.png', width: 35.0, height: 35.0),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns:1,
                                  child: Tab(
                                    icon: Image.asset('assets/Applogo/applogo.png', width: 45.0, height: 45.0),
                                  ),
                                ),
                              ],
                              indicatorSize: TabBarIndicatorSize.label, // You can use TabBarIndicatorSize.tab for different style
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // You can customize the border radius
                                color: AppTheme.Tabselector(context) // You can set your preferred color
                              ),
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
                                setting()  ,
                                Usersetting(),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/chat');
                      // Handle logout
                    },
                    style: ElevatedButton.styleFrom(
                      primary:  Colors.red, // Set the primary color to orange
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      width: double.infinity, // Set the width to take up the full screen
    );
  }
}

