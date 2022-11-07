import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  ///共通ダイアログコンポーネント
  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
    this.primaryText = "OK",
    this.secondaryText = "NG",
  }) : super(key: key);

  final String title;
  final Widget content;
  final VoidCallback onPressed;
  final String primaryText;
  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(primaryText),
          style: ElevatedButton.styleFrom(primary: Colors.indigo),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(secondaryText),
          style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
        )
      ],
    );
  }
}
