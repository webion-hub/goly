import 'package:flutter/material.dart';

Center circularProgress(context) {
  return Center(
    child: CircularProgressIndicator(
      color: Theme.of(context).colorScheme.secondary,
    ),
  );
}

LinearProgressIndicator linearProgress(context) {
  return LinearProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.secondary),
  );
}
