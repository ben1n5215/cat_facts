import 'package:flutter/material.dart';

class CatError extends StatelessWidget {
  const CatError({super.key, required this.textError});

  final String textError;
  static const black = Colors.black;

  static const sizeOfText = 20.0;
  static const sizeOfErrorIcon = 50.0;

  static const space = SizedBox(height: 15.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: sizeOfErrorIcon,
              ),
              space,
              Text(
                textError,
                textAlign: TextAlign.center,
                style: const TextStyle(color: black, fontSize: sizeOfText),
              ),
            ],
          ),
        ));
  }
}
