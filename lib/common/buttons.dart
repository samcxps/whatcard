import 'package:flutter/material.dart';
import 'package:whatcard/theme.dart';

enum ButtonType { primary, secondary, tertiary }

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.type,
    required this.title,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  final ButtonType type;
  final String title;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return WhatCardTheme.of(context).primaryGray; // Regular color
                }

                switch (type) {
                  case ButtonType.primary:
                    return WhatCardTheme.of(context).primaryColor;
                  case ButtonType.secondary:
                    return WhatCardTheme.of(context).secondaryColor;
                  case ButtonType.tertiary:
                    return Colors.transparent;
                }
              },
            ),
            elevation: MaterialStateProperty.resolveWith<double>((states) {
              switch (type) {
                case ButtonType.primary:
                  return 4.0;
                case ButtonType.secondary:
                  return 4.0;
                case ButtonType.tertiary:
                  return 0;
              }
            })),
        child: isLoading
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2.0),
                child: CircularProgressIndicator(
                  color: type == ButtonType.primary
                      ? WhatCardTheme.of(context).secondaryText
                      : WhatCardTheme.of(context).primaryText,
                  strokeWidth: 3,
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: type == ButtonType.primary
                    ? WhatCardTheme.of(context).bodyText2
                    : WhatCardTheme.of(context).bodyText1,
              ),
      ),
    );
  }
}
