import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../utils/Customized/CustomSlider.dart';
import '../../../utils/Customized/CustomizedSwitch.dart';
import '../../../utils/ThemeNotifier.dart';

class Usersetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color cardBackgroundColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white60 // Set your dark mode background color here
        : Colors.white; // Set your light mode background color here
    Color borderColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white // Border color in dark mode
        : Colors.black; // Border color in light mode
    Color slideractive = Theme.of(context).brightness == Brightness.dark
        ? Colors.white // Border color in dark mode
        : Colors.black; // Border color in light mode
    Color sliderinactive = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70 // Border color in dark mode
        : Colors.black38; // Border color in light mode
    return Card(
      elevation: 9.0,
      color: cardBackgroundColor,
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
              style: Theme.of(context).textTheme.headline6,
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
              borderColor: borderColor,
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
                    child: Slider(
                      value: 1.0,
                      min: 1.0,
                      max: 4.0,
                      divisions: 3,
                      onChanged: (double value) {
                        // Handle font size adjustment based on the slider value
                      },
                      label: _getLabel(1.0), // Initial label
                      activeColor: slideractive,
                      inactiveColor: sliderinactive,
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
    Map<double, String> labels = {
      1.0: 'Small',
      2.0: 'Medium',
      3.0: 'Large',
      4.0: 'XL',
    };

    return labels[value] ?? ''; // Return the label for the given value, or an empty string if not found
  }

}
