import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.isEnabled = true,
    required this.onPressed,
    required this.buttonColor,
    required this.textButtonColor,
  });

  final String text;
  final bool isEnabled;
  final Color buttonColor;
  final Color textButtonColor;
  final VoidCallback? onPressed;

  static const black = Colors.black;

  static const elevation = 0.0;
  static const iconSize = 20.0;
  static const sizeOfText = 24.0;

  final emptyButtonIcon = Container();
  static const emptySpace = SizedBox();
  static const spaces = SizedBox(width: 8.0);
  static const paddingButton = EdgeInsets.all(8.0);
  static const paddingImage = EdgeInsets.only(left: 1.0, right: 3.0);
  static const paddingAroundButton = EdgeInsets.symmetric(vertical: 12.0);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: elevation,
        shadowColor: Colors.transparent,
        padding: paddingButton,
        shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
      child: Padding(
        padding: paddingAroundButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            spaces,
            Text(
              text,
              style:const TextStyle(fontSize: sizeOfText,color: black),
            ),
          ],
        ),
      ),
    );
  }
}
