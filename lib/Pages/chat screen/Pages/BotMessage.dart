import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xonext/utils/AppTheme.dart';

import '../../../utils/Customized/Waveformprogressbar.dart';
import '../../../utils/Customized/clickabletext.dart';
import '../../../utils/Fontsize.dart';
import 'veritybotresponse/CodeSnippet.dart';
import 'veritybotresponse/DefaultTextUI.dart';
import 'veritybotresponse/ProductSuggestion.dart';



/*class BotMessage extends StatelessWidget {
  final String text;

  BotMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    // Check if the bot's response contains code snippets
    bool isCodeSnippet = text.contains('```');

    // Check if the bot's response contains a product suggestion
    bool isProductSuggestion = text.contains('Product:');

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
                  child: Image.asset(
                    AppTheme.getAppLogo(context),
                    width: 34,
                    height: 34,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (isCodeSnippet) ...[
                          // Render code snippet UI
                          CodeSnippet(text: text, title: '',),
                        ] else if (isProductSuggestion) ...[
                          // Render product suggestion UI
                          ProductSuggestion(text: text),
                        ] else ...[
                          // Render waveform progress bar
                          WaveformProgressBar(
                            progress: 0.6, // Example progress value (0 to 1)
                            totalBars: 24,
                            barSpacing: 6,
                          ),
                          DefaultTextUI(text: text),
                        ],
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
                    _copyToClipboard(text, context);
                  },
                  tooltip: 'Copy',
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  selectedIcon: Icon(Icons.thumb_up_off_alt_rounded),
                  onPressed: () {
                    // Handle like functionality
                  },
                  tooltip: 'Like',
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined),
                  selectedIcon: Icon(Icons.thumb_down_alt_rounded),
                  onPressed: () {
                    // Handle dislike functionality
                  },
                  tooltip: 'Dislike',
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
  }
}*/

import 'package:flutter_html/flutter_html.dart';

//html
/*class BotMessage extends StatelessWidget {
  final String text;
  final bool isError;

  BotMessage({required this.text, this.isError = false});

  @override
  Widget build(BuildContext context) {
    if (containsCodeSnippet(text)) {
      // Display code snippet
      return CodeSnippet(title: "Code Snippet", text: text);
    } else {
      // Display HTML content
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
                    backgroundColor: isError ? Colors.red : AppTheme.boticonbackgroud(context),
                    child: Image.asset(
                      AppTheme.getAppLogo(context), width: 34, height: 34,),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          isError
                              ? Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(Icons.error, color: Colors.red, size: 24),
                          )
                              : WaveformProgressBar(
                            progress: 0.6, // Example progress value (0 to 1)
                            totalBars: 24,
                            barSpacing: 6,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: Html(data: text), // Render HTML content
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
                      _copyToClipboard(text, context); // Call copy function
                    },
                    tooltip: 'Copy',
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up_alt_outlined),
                    selectedIcon: Icon(Icons.thumb_up_off_alt_rounded),
                    onPressed: () {
                      // Add your functionality for the like button
                    },
                    tooltip: 'Like',
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_down_alt_outlined),
                    selectedIcon: Icon(Icons.thumb_down_alt_rounded),
                    onPressed: () {
                      // Add your functionality for the dislike button
                    },
                    tooltip: 'Dislike',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Text copied to clipboard')),
    );
  }

  bool containsCodeSnippet(String text) {
    // Implement your logic to check if the text contains code snippets
    // You can use regular expressions or any other method to identify code snippets
    // For simplicity, let's assume code snippets are enclosed in backticks (`) or triple backticks (```)
    return text.contains('`') || text.contains('```');
  }
}*/




class BotMessage extends StatelessWidget {
  final String text;
  final bool isError;

  BotMessage({required this.text, this.isError = false});

  @override
  Widget build(BuildContext context) {
    final parts = _parseText(text);

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
                  backgroundColor: isError ? Colors.red : AppTheme.boticonbackgroud(context),
                  child: Image.asset(AppTheme.getAppLogo(context), width: 34, height: 34),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (isError)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(Icons.error, color: Colors.red, size: 24),
                          )
                        else
                          ...parts.map((part) {
                            if (part.isCode) {
                              final language = _detectLanguage(part.text);
                              return CodeSnippet(htmlText: part.text, language: language);
                            } else {
                              return Html(
                                data: part.text,
                                style: {
                                  'body': Style(
                                    fontSize: FontSize(Provider.of<FontSizeNotifier>(context).fontSize),
                                    color: isError ? Colors.red : null,
                                  ),
                                },
                              );
                            }
                          }).toList(),
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
                    _copyToClipboard(text, context);
                  },
                  tooltip: 'Copy',
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  selectedIcon: Icon(Icons.thumb_up_off_alt_rounded),
                  onPressed: () {
                    // Add your functionality for the like button
                  },
                  tooltip: 'Like',
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined),
                  selectedIcon: Icon(Icons.thumb_down_alt_rounded),
                  onPressed: () {
                    // Add your functionality for the dislike button
                  },
                  tooltip: 'Dislike',
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
  }

  List<_TextPart> _parseText(String text) {
    final parts = <_TextPart>[];
    final RegExp codeSnippetRegex = RegExp(r'(```[\s\S]*?```|`[^`]*`)');
    final matches = codeSnippetRegex.allMatches(text);

    int currentIndex = 0;
    for (final match in matches) {
      if (match.start > currentIndex) {
        parts.add(_TextPart(text.substring(currentIndex, match.start), isCode: false));
      }
      parts.add(_TextPart(match.group(0)!, isCode: true));
      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      parts.add(_TextPart(text.substring(currentIndex), isCode: false));
    }

    return parts;
  }

  String _detectLanguage(String text) {
    // Simple heuristic to detect language, you can use more advanced techniques or libraries.
    if (text.contains('public class') || text.contains('System.out.println')) {
      return 'java';
    } else if (text.contains('def ') || text.contains('print(')) {
      return 'python';
    } else if (text.contains('function') || text.contains('console.log')) {
      return 'javascript';
    }
    // Add more language detection as needed
    return 'plaintext';
  }
}

class _TextPart {
  final String text;
  final bool isCode;

  _TextPart(this.text, {required this.isCode});
}












//success error ui
/*class BotMessage extends StatelessWidget {
  final String text;
  final bool isError;

  BotMessage({required this.text, this.isError = false});

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
                  backgroundColor: isError ? Colors.red : AppTheme.boticonbackgroud(context),
                  child: Image.asset(
                    AppTheme.getAppLogo(context), width: 34, height: 34,),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        isError ? Icon(Icons.error, color: Colors.red) : WaveformProgressBar(
                          progress: 0.6, // Example progress value (0 to 1)
                          totalBars: 24, barSpacing: 6, // Total number of bars in the waveform
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: CustomText(
                            text: text,
                            style: TextStyle(
                              fontSize: Provider.of<FontSizeNotifier>(context).fontSize,
                              color: isError ? Colors.red : null, // Apply red color if it's an error
                            ),
                          ),
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
                    // Add your functionality for the copy button
                    _copyToClipboard(text, context);
                  },
                  tooltip: 'Copy',
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  selectedIcon: Icon(Icons.thumb_up_off_alt_rounded),
                  onPressed: () {
                    // Add your functionality for the like button
                  },
                  tooltip: 'Like',
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined),
                  selectedIcon: Icon(Icons.thumb_down_alt_rounded),
                  onPressed: () {
                    // Add your functionality for the dislike button
                  },
                  tooltip: 'Dislike',
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
  }
}*/




//old ui
/*class BotMessage extends StatelessWidget {
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
                  child:Image.asset(
                      AppTheme.getAppLogo(context),width: 34,height: 34,)

                )
                ,
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
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
                  totalBars: 24, barSpacing: 6, // Total number of bars in the waveform
                     ),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: CustomText(text:
                            text,
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
  }}*/
