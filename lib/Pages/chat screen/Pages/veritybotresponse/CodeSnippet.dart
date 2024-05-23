import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for clipboard functionality
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:provider/provider.dart';
import '../../../../utils/AppTheme.dart';
import '../../../../utils/Fontsize.dart';

class CodeSnippet extends StatelessWidget {
  final String htmlText;

  const CodeSnippet({Key? key, required this.htmlText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extracting the code from the htmlText if necessary
    String code = _extractCodeFromHtml(htmlText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            IconButton(
              icon: Icon(Icons.copy), // Copy icon
              onPressed: () {
                _copyToClipboard(code, context);
              },
            ),
          ],
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
          child: Theme(
            data: ThemeData(
              brightness: AppTheme.isDarkMode(context) ? Brightness.dark : Brightness.light,
            ),
            child: HighlightView(
              code,
              language: 'dart', // Specify the language of the code
              theme: githubTheme, // You can choose different themes
              padding: const EdgeInsets.all(12.0),
              textStyle: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: Provider.of<FontSizeNotifier>(context).fontSize,
                color: AppTheme.codeColor(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _extractCodeFromHtml(String htmlText) {
    // Example of simple code extraction, may need improvements based on actual HTML structure
    return htmlText.replaceAll('```', '').replaceAll('`', '').trim();
  }

  void _copyToClipboard(String code, BuildContext context) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Code copied to clipboard'),
      ),
    );
  }
}
