import 'package:flutter/material.dart';

class CustomContainerPadding extends StatelessWidget {
  const CustomContainerPadding({
    super.key,
    required this.widget,
    required this.gradientColor,
  });
  final Widget widget;
  final BoxDecoration gradientColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(child: widget),
      ),
    );
  }
}
