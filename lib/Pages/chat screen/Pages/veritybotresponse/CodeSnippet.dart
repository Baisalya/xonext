import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../../../../utils/AppTheme.dart';
import '../../../../utils/Fontsize.dart';

class CodeSnippet extends StatelessWidget {
  final String htmlText;

  const CodeSnippet({Key? key, required this.htmlText}) : super(key: key);

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
            "Code Snippet",
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
          child: Html(
            data: htmlText.replaceAll('```', '').replaceAll('`', ''), // Clean up the backticks
            style: {
              'pre': Style(
                fontFamily: 'RobotoMono',
                fontSize: FontSize(Provider.of<FontSizeNotifier>(context).fontSize),
                letterSpacing: -0.5,
                color: AppTheme.codeColor(context),
              ),
              'code': Style(
                fontFamily: 'RobotoMono',
                fontSize: FontSize(Provider.of<FontSizeNotifier>(context).fontSize),
                letterSpacing: -0.5,
                color: AppTheme.codeColor(context),
              ),
            },
          ),
        ),
      ],
    );
  }
}
