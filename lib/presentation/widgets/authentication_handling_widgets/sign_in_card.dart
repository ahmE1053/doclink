import 'package:flutter/material.dart';

class SigninCard extends StatelessWidget {
  const SigninCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
  });

  final Color color;
  final Widget icon;
  final Widget text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 3,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 1)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: FittedBox(
              child: icon,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
