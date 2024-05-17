import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Function(String)? onOpenUrl;

  const  CustomText({
    Key? key,
    required this.text,
    this.style,
    this.onOpenUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyText1!.color,
      fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
    ).merge(style);

    return RichText(
      text: _buildTextSpan(context, defaultStyle),
    );
  }

  TextSpan _buildTextSpan(BuildContext context, TextStyle style) {
    final RegExp urlRegex = RegExp(
      r"(https?://[^\s]+)",
      caseSensitive: false,
      multiLine: false,
    );
    final RegExp codeRegex = RegExp(
      r"(```[\s\S]+?```)",
      caseSensitive: false,
      multiLine: true,
    );

    final matches = urlRegex.allMatches(text);
    final codeMatches = codeRegex.allMatches(text);

    List<TextSpan> textSpans = [];

    int lastMatchEnd = 0;
    for (RegExpMatch match in matches) {
      if (match.start > lastMatchEnd) {
        textSpans.add(
          TextSpan(
            text: text.substring(lastMatchEnd, match.start),
            style: style,
          ),
        );
      }
      textSpans.add(
        TextSpan(
          text: match.group(0),
          style: style.copyWith(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (onOpenUrl != null) {
                onOpenUrl!(match.group(0)!);
              }
            },
        ),
      );
      lastMatchEnd = match.end;
    }

    for (RegExpMatch match in codeMatches) {
      if (match.start > lastMatchEnd) {
        textSpans.add(
          TextSpan(
            text: text.substring(lastMatchEnd, match.start),
            style: style,
          ),
        );
      }
      textSpans.add(
        TextSpan(
          text: match.group(0),
          style: style.copyWith(
            color: Colors.green, // You can customize code snippet style
            fontFamily: 'Courier', // Example for monospaced font
          ),
        ),
      );
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(lastMatchEnd),
          style: style,
        ),
      );
    }

    return TextSpan(children: textSpans);
  }
}

/*
class ClickableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Function(String)? onOpenUrl;

  const ClickableText({
    Key? key,
    required this.text,
    this.style,
    this.onOpenUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyText1!.color,
      fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
    ).merge(style);

    return RichText(
      text: _buildTextSpan(context, defaultStyle),
    );
  }

  TextSpan _buildTextSpan(BuildContext context, TextStyle style) {
    final RegExp urlRegex = RegExp(
      r"(https?://[^\s]+)",
      caseSensitive: false,
      multiLine: false,
    );

    final matches = urlRegex.allMatches(text);
    List<TextSpan> textSpans = [];

    int lastMatchEnd = 0;
    for (RegExpMatch match in matches) {
      if (match.start > lastMatchEnd) {
        textSpans.add(
          TextSpan(
            text: text.substring(lastMatchEnd, match.start),
            style: style,
          ),
        );
      }
      textSpans.add(
        TextSpan(
          text: match.group(0),
          style: style.copyWith(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (onOpenUrl != null) {
                onOpenUrl!(match.group(0)!);
              }
            },
        ),
      );
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(lastMatchEnd),
          style: style,
        ),
      );
    }

    return TextSpan(children: textSpans);
  }
}
*/
