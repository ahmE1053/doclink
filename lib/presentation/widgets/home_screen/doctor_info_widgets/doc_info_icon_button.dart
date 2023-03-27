import 'package:flutter/material.dart';

class DocInfoIconButton extends StatelessWidget {
  const DocInfoIconButton({
    super.key,
    required this.icon,
    this.onTap,
    required this.color,
  });
  final IconData icon;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
