import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  final String text;

  UserMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 50.0, bottom: 10.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Add your logic for the first IconButton
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Add your logic for the second IconButton
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              text,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          ,
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
}
