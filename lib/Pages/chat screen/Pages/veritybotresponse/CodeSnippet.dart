import 'package:flutter/material.dart';
import '../../../../utils/AppTheme.dart';


class CodeSnippet extends StatelessWidget {
  final String title;
  final String text;

  const CodeSnippet({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppTheme.titleHeader(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppTheme.titleText(context),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppTheme.snippetColor(context),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 16.0,
                letterSpacing: -0.5,
                color: AppTheme.codeColor(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

