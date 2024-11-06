import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xonext/utils/AppTheme.dart';
import 'package:xonext/utils/Customized/clickabletext.dart';
import 'package:url_launcher/url_launcher.dart'; // Import this package to launch URLs
import '../../../utils/Fontsize.dart';

class UserMessage extends StatelessWidget {
  final String text;

  UserMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Card(
              color: AppTheme.UserChatcardBgColor2(context),
              surfaceTintColor:AppTheme.UserChatcardBgColor2(context) ,
              shadowColor: AppTheme.shadowcolor(context), // Set the shadow color
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0), // Rectangular corner
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0), // Add top margin here
                    child: Row(
                      children: [
                        SizedBox(width: 50,),
                        IconButton(
                          icon: Icon(CupertinoIcons.arrow_2_circlepath_circle,color: AppTheme.iconcolor(context),), // Replace with your first icon
                          onPressed: () {
                            // Add functionality for the first icon button
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outlined,color: AppTheme.iconcolor(context),), // Replace with your second icon
                          onPressed: () {
                            // Add functionality for the second icon button
                          },
                        ),

                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    padding: EdgeInsets.fromLTRB(11, 4, 16, 16),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: CustomText (

                      style: TextStyle(fontSize: Provider.of<FontSizeNotifier>(context).fontSize),
                      text: text,
                      onOpenUrl: (String url) {
                        launch(url); // Open URL when tapped
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.0,),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('U', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}


/*
class UserMessages extends StatelessWidget {
  final String text;

  UserMessages({required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        */
/*Container(
          margin: const EdgeInsets.only(right: 50.0, bottom: 10.0),
          child:Card(
            shadowColor: AppTheme.shadowcolor(context), // Set the shadow color

            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0), // Rectangular corner
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        _buildActionButtons(context),
                        SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              text,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: Provider.of<FontSizeNotifier>(context).fontSize,
                              ),
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


        ),*//*

        Card(
          shadowColor: AppTheme.shadowcolor(context), // Set the shadow color
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.zero,
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0), // Rectangular corner
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0), // Add top margin here
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.access_alarm_sharp), // Replace with your first icon
                      onPressed: () {
                        // Add functionality for the first icon button
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.access_alarm_sharp), // Replace with your second icon
                      onPressed: () {
                        // Add functionality for the second icon button
                      },
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  text,
                  style: TextStyle(fontSize: Provider.of<FontSizeNotifier>(context).fontSize),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('U', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Add your logic for the edit IconButton
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Add your logic for the delete IconButton
          },
        ),
      ],
    );
  }
}
*/

