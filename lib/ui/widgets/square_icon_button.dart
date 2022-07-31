import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/styles/colors.dart';
import 'package:pokedex_app/ui/styles/text_styles.dart';

class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final String text;

  const SquareIconButton({Key key, this.icon, this.onTap, this.text = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 44,
          width: icon != null ? 44 : 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: secondaryColor,
          ),
          child: Center(
              child: icon != null
                  ? Icon(icon, color: iconColor)
                  : Text(
                      text,
                      style: titleTextStyle.copyWith(fontSize: 18),
                    )),
        ));
  }
}
