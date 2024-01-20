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
              'Theme',
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
              Theme.of(context).brightness == Brightness.dark ? ' Click to switch to Day Mode' : 'Click to switch to Dark Mode',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 18.0),
            Text(
              'Adjust Font Size',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'A',
                  style: TextStyle(fontSize: 14.0), // Placeholder for font size
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 8.0, // Adjust the value to make the slider thicker

                      // Customize the track colors
                      activeTrackColor: Colors.blue, // Color of the active part of the slider
                      inactiveTrackColor: Colors.grey, // Color of the inactive part of the slider

                      // Customize the thumb shape and color
                      thumbShape: CustomSliderThumbShape(),
                      thumbColor: Colors.blue,

                      // Customize the overlay appearance when dragging the slider
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
                      overlayColor: Colors.blue.withOpacity(0.3),
                    ),
                    child:  Slider(
                  value: Provider.of<FontSizeNotifier>(context).fontSize,
                  min: 10.0,
                  max: 40.0,
                  divisions: 3,
                  onChanged: (double value) {
                    double fontSize;

                    if (value <= 15.0) {
                      fontSize = 10.0; // Font size increments to 10 when value is less than or equal to 15
                    } else if (value <= 25.0) {
                      fontSize = 25.0; // Font size increments to 25 when value is less than or equal to 25
                    } else if (value <= 35.0) {
                      fontSize = 30.0; // Font size increments to 30 when value is less than or equal to 35
                    } else {
                      fontSize = 40.0; // Font size increments to 40 when value is greater than 35
                    }

                    Provider.of<FontSizeNotifier>(context, listen: false).setFontSize(fontSize);
                  },
                  label: _getLabel(1.0), // Initial label
                  activeColor: AppTheme.sliderActiveColor(context),
                  inactiveColor: AppTheme.sliderInactiveColor(context),
                ),
                  )


                ),
                Text(
                  'A',
                  style: TextStyle(fontSize: 24.0), // Placeholder for font size
                ),
              ],
            ),
            SizedBox(height: 18.0),
            Text("The text font size will adjust"),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/home');
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
    );
  }
  String _getLabel(double value) {
    Map<int, String> labels = {
      1: 'Small',
      2: 'Medium',
      3: 'Large',
      4: 'Extra large',
    };

    int intValue = value.toInt();
    return labels[intValue] ?? '';
  }

}
