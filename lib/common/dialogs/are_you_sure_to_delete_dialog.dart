import 'package:app_template/common/extension/hard_coded_string.dart';
import 'package:flutter/material.dart';

Future<bool> showAreYouSureToDeleteDialog(BuildContext context) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Conferma cancellazione'.hardcoded),
        content: Text('Sei sicuro di voler cancellare?'.hardcoded),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Annulla'.hardcoded),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
            },
            child: Text('Cancella'.hardcoded),
          ),
        ],
      );
    },
  );
}
