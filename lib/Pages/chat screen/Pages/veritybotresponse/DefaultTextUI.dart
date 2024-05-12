import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/Customized/clickabletext.dart';
import '../../../../utils/Fontsize.dart';

class DefaultTextUI extends StatelessWidget {
  final String text;

  DefaultTextUI({required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: Provider.of<FontSizeNotifier>(context).fontSize,
      ),
    );
  }
}