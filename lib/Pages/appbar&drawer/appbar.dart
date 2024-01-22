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
              Color(0xFF73D375), // Darker color
              Color(0xFFB6C45D), // Lighter color
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: SafeArea(
        child: Container(
          color: AppTheme.backgroundColor(context),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/Applogo/applogo.png'),
                      backgroundColor: AppTheme.backgroundColor(context),
                      radius: screenWidth * 0.05,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.02, 0, screenWidth * 0.02, 0),
                child: Divider(
                  color: AppTheme.dividercolor(context),
                  thickness: 2,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth * 0.15,
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: TabBar(
                                  controller: tabController,
                                  isScrollable: true,
                                  labelColor: Colors.blue,
                                  tabs: [
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: Tab(
                                        icon: Image.asset('assets/setting.png', width: screenWidth * 0.07, height: screenWidth * 0.07, color: AppTheme.iconcolor(context)),
                                      ),
                                    ),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: Tab(
                                        icon: Image.asset('assets/Applogo/applogo.png', width: screenWidth * 0.09, height: screenWidth * 0.09),
                                      ),
                                    ),
                                  ],
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                                    color: AppTheme.Tabselector(context),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: screenHeight * 0.72,
                                child: TabBarView(
                                  controller: tabController,
                                  physics: ClampingScrollPhysics(),
                                  children: [
                                    SingleChildScrollView(child: Setting()),
                                    SingleChildScrollView(child: Usersetting()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      width: double.infinity,
    );
  }
}

