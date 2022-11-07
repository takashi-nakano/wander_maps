import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  /// 共通ボタンコンポーネント
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.width = double.infinity,
    this.height = 60,
    this.iconData,
  }) : super(key: key);

  //ボタン押下時処理
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final double height;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: (iconData != null)
            ? Row(
                children: [
                  Icon(iconData),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: textColor),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(color: textColor),
                overflow: TextOverflow.ellipsis,
              ),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            color: Colors.white,
          ),
          primary: buttonColor,
        ),
      ),
    );
  }
}
