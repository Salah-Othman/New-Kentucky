import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    required this.weight,
    this.color,
    this.maxLines,
    this.textAlign,
    this.decoration,
    this.decorationColor,
  });
  final String text;
  final double size;
  final int? maxLines;
  final FontWeight weight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
