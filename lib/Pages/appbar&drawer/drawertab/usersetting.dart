import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/ThemeNotifier.dart';

class Usersetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
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
            Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                ThemeMode selectedMode = value ? ThemeMode.dark : ThemeMode.light;
                Provider.of<ThemeNotifier>(context, listen: false)
                    .setTheme(selectedMode);
              },
              activeColor: Theme.of(context).hoverColor,
            ),
            Text(
              Theme.of(context).brightness == Brightness.dark ? ' Click to switch to Dark Mode' : 'Click to switch to Day Mode',
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
                  child: Slider(
                    value: 1.0,
                    min: 1.0,
                    max: 4.0,
                    divisions: 3,
                    onChanged: (double value) {
                      // Handle font size adjustment based on the slider value
                    },
                    label: 'Adjust Font Size',
                    activeColor: Theme.of(context).focusColor,
                  ),
                ),
                Text(
                  'A',
                  style: TextStyle(fontSize: 24.0), // Placeholder for font size
                ),
              ],
            ),
            SizedBox(height: 18.0),
            Text("The text font size will adjust"),
            SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              style: ElevatedButton.styleFrom(
                primary:  Colors.orange, // Set the primary color to orange
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
}
