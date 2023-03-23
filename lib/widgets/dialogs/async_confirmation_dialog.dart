import 'package:flutter/material.dart';
import 'package:goly/widgets/layout/indicators.dart';

class AsyncConfirmationDialog extends StatefulWidget {
  final String title;
  final String message;
  final Function noAction;
  final Future Function() yesAction;
  const AsyncConfirmationDialog({
    required this.title,
    required this.message,
    required this.noAction,
    required this.yesAction,
    super.key,
  });

  @override
  State<AsyncConfirmationDialog> createState() => _AsyncConfirmationDialogState();
}

class _AsyncConfirmationDialogState extends State<AsyncConfirmationDialog> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? buffering()
        : AlertDialog(
            title: Text(widget.title),
            content: Text(widget.message),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('No'),
                onPressed: () => widget.noAction(),
              ),
              ElevatedButton(
                child: const Text('Yes'),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await widget.yesAction();
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ],
          );
  }
}
