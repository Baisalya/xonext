import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../utils/AppTheme.dart';
import '../../../utils/Customized/CustomSlider.dart';
import '../../../utils/Customized/CustomizedSwitch.dart';
import '../../../utils/ThemeNotifier.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 9.0,
      color: AppTheme.cardBackgroundColor(context),
      shadowColor: Colors.grey.shade700, // Adjusted shadow color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Language',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18.0),
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
                      width: 200, // Set the width of the dropdown item
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), // Set border radius
                        color: AppTheme.cardBackgroundColor(context),
                        border: Border.all(
                            color: AppTheme.borderColor(context))// Set background color
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Set text color
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 18.0),

            Text(
              'Transliteration',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18.0),
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
              borderWidth: 2.0,),

            SizedBox(height: 18.0),
            Text(
              'Advance Settings ',
              style: Theme.of(context).textTheme.headline6,
            ),

          ],
        ),
      ),
    );
  }

}
