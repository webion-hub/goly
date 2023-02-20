import 'package:flutter/material.dart';
import 'package:goly/widgets/dialogs/async_confirmation_dialog.dart';
import 'package:goly/widgets/list_tile/dismissible_background.dart';

class DismissibleListTile extends StatelessWidget {
  final Key uniqueKey;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Widget child;
  const DismissibleListTile({super.key, required this.confirmDismiss,  required this.uniqueKey, required this.child,});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: uniqueKey,
        background: const DismissibleBackground(),
        direction: DismissDirection.endToStart,
        confirmDismiss: confirmDismiss,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: child,
        ),
      );
  }
}