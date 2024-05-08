import 'package:flutter/material.dart';

class DeviderLine extends StatelessWidget {
  const DeviderLine({
    super.key,
    required this.colorLine,
  });

  final Color colorLine;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: colorLine,
    );
  }
}
