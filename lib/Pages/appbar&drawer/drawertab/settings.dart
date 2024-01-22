import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../utils/AppTheme.dart';
import '../../../utils/Customized/CustomSlider.dart';
import '../../../utils/Customized/CustomizedSwitch.dart';
import '../../../utils/ThemeNotifier.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 9.0,
      color: AppTheme.cardBackgroundColor(context),
      shadowColor: Colors.grey.shade700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.04), // Adjust border radius based on screen width
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Adjust padding based on screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Language',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenWidth * 0.04), // Adjust spacing based on screen width
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: 'English',
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                  // You can add logic here to change the language
                },
                items: <String>['Odia', 'English', 'Hindi', 'Bengali']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      width: screenWidth * 0.4, // Adjust the width here
                      height: screenHeight * 0.7,
                 /*     padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                          vertical: screenWidth * 0.1),*/
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.01), // Adjust the border radius
                        color: AppTheme.cardBackgroundColor(context),
                        border: Border.all(color: AppTheme.borderColor(context)),
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: screenWidth * 0.04), // Adjust spacing based on screen width
            Text(
              'Transliteration',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenWidth * 0.04), // Adjust spacing based on screen width
            CustomizedSwitch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                ThemeMode selectedMode = value ? ThemeMode.dark : ThemeMode.light;
                Provider.of<ThemeNotifier>(context, listen: false)
                    .setTheme(selectedMode);
              },
              activeColor: Theme.of(context).hoverColor,
              inactiveColor: Colors.white,
              borderColor: AppTheme.borderColor(context),
              borderWidth: 2.0,
            ),
            SizedBox(height: screenWidth * 0.04), // Adjust spacing based on screen width
            ListTile(
              title: Text(
                'Advance Settings',
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: IconButton(
                icon: Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            if (_isExpanded)
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenWidth * 0.04),
                    Text('Additional Setting 1'),
                    SizedBox(height: screenWidth * 0.04),
                    Text('Additional Setting 2'),
                    // Add more widgets as needed
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }
}

