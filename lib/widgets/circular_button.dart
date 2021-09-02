import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Function onClick;
  final IconData icon;

  const CircularButton(this.icon, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white70,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
