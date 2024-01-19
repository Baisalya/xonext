import 'package:flutter/material.dart';

class BotMessage extends StatelessWidget {
  final String text;

  BotMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.green, // Change to the color you prefer for the bot
              child: Text('B', style: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Bot', style: Theme.of(context).textTheme.headline6),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text(text),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
