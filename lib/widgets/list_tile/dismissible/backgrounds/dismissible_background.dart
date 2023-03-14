import 'package:flutter/material.dart';
import 'package:goly/widgets/list_tile/dismissible/backgrounds/delete_background.dart';

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const DeleteBackground());
  }
}
