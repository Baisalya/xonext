import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xonext/utils/AppTheme.dart';

import '../../../utils/Customized/Waveformprogressbar.dart';
import '../../../utils/Fontsize.dart';

class BotMessage extends StatelessWidget {
  final String text;

  BotMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: CircleAvatar(
                  backgroundColor: AppTheme.boticonbackgroud(context),
                  child: Theme.of(context).brightness == Brightness.dark
                      ? Image.asset('assets/Applogo/mo_chatbot_dark.png', width: 34, height: 34,)
                      : Image.asset('assets/Applogo/mo_chatbot_light.png', width: 34, height: 34,),
                )
                ,
              ),
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WaveformProgressBar(
                  progress: 0.6, // Example progress value (0 to 1)
                  totalBars: 30, barSpacing: 4, // Total number of bars in the waveform
                     ),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Text(text,
                            style:TextStyle(fontSize: Provider.of<FontSizeNotifier>(context).fontSize),                           ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.copy_all),
                  onPressed: () {
                    // Add your functionality for the third button
                    _copyToClipboard(text, context);
                  },
                    tooltip: 'Copy'
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  selectedIcon: Icon(Icons.thumb_up_off_alt_rounded),
                  onPressed: () {
                    // Add your functionality for the first button
                  },tooltip: 'Like'
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined),
                    selectedIcon: Icon(Icons.thumb_down_alt_rounded),

                    onPressed: () {
                    // Add your functionality for the second button
                  },
                    tooltip: 'Dislike'
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }


  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Text copied to clipboard')),
    );
  }}
