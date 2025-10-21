import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Errore!',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Divider(
                color: Colors.red,
              ),
            ),
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
