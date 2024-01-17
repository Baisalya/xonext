import 'package:flutter/material.dart';

import '../appbar&drawer/appbar.dart';


class HomeScreen extends StatefulWidget  {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync:this); // Adjust the length as needed
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(tabController: _tabController,),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
