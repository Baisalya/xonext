import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../utils/AppTheme.dart';
import '../../../utils/Customized/CustomSlider.dart';
import '../../../utils/Customized/CustomizedSwitch.dart';
import '../../../utils/Fontsize.dart';
import '../../../utils/ThemeNotifier.dart';

class Usersetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 9.0,
      color: AppTheme.cardBackgroundColor(context),
      shadowColor: Colors.grey.shade700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03), // Adjust padding based on screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
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
            SizedBox(height: screenHeight * 0.02),
            Text(
              Theme.of(context).brightness == Brightness.dark
                  ? ' Click to switch to Day Mode'
                  : 'Click to switch to Dark Mode',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Adjust Font Size',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'A',
                  style: TextStyle(fontSize: screenWidth * 0.02), // Adjust font size based on screen width
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: screenHeight * 0.015,
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey,
                      thumbShape: CustomSliderThumbShape(),
                      thumbColor: Colors.blue,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: screenWidth * 0.03),
                      overlayColor: Colors.blue.withOpacity(0.3),
                    ),
                    child: Slider(
                      value: Provider.of<FontSizeNotifier>(context).fontSize,
                      min: 16.0,
                      max: 40.0,
                      divisions: 3,
                      onChanged: (double value) {
                        double fontSize;

                        if (value <= 20.0) {
                          fontSize = 16.0;
                        } else if (value <= 30.0) {
                          fontSize = 25.0;
                        } else if (value <= 35.0) {
                          fontSize = 30.0;
                        } else {
                          fontSize = 40.0;
                        }

                        Provider.of<FontSizeNotifier>(context, listen: false)
                            .setFontSize(fontSize);
                      },
                      label: (() {
                        double value = Provider.of<FontSizeNotifier>(context).fontSize;

                        if (value == 16.0) {
                          return 'Small';
                        } else if (value == 25.0) {
                          return 'Medium';
                        } else if (value == 30.0) {
                          return 'Large';
                        } else {
                          return 'Extra Large';
                        }
                      })(),
                      activeColor: AppTheme.sliderActiveColor(context),
                      inactiveColor: AppTheme.sliderInactiveColor(context),
                    ),
                  ),
                ),
                Text(
                  'A',
                  style: TextStyle(fontSize: screenWidth * 0.03),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text("The text font size will adjust"),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: screenWidth * 0.03),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}