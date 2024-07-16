import 'package:flutter/material.dart';

class EmptySpace extends StatelessWidget {
  const EmptySpace(
    this.height, {
    super.key,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
