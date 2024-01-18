

import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  final String text;

  UserMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,  // Align user messages to the right
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,  // Align user messages to the right
                  children: <Widget>[
                    Text('User', style: Theme.of(context).textTheme.headline6),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text(text),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('U', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
