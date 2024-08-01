import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(12)),
      child: widget.child,
    );
  }
}
