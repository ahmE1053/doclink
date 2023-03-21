import 'package:flutter/material.dart';

Future<Widget?> errorDialog(String errorText, BuildContext context) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: FittedBox(
          child: Text(
            errorText,
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          )
        ],
      ),
    );
