import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFound extends StatelessWidget {
  const NotFound({
    Key? key,
    required this.mq,
    this.text = 'Your search didn\'t come up \nwith any results',
  }) : super(key: key);
  final Size mq;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: mq.height * 0.5,
        width: mq.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset(
              'assets/lottie/not_found.json',
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 8),
            FittedBox(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
