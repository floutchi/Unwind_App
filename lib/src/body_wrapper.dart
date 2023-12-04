import 'package:flutter/material.dart';

class BodyWrapper extends StatelessWidget {
  const BodyWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      child: child,
    );
  }
}
