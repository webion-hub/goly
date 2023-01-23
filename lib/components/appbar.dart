import 'package:flutter/material.dart';

AppBar header(context) {
  return AppBar(
    title: const Text('Goly'),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(Icons.message),
      )
    ],
  );
}
