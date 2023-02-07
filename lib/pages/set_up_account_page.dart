import 'package:flutter/material.dart';

class SeteUpAccountPage extends StatelessWidget {
  const SeteUpAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: '');
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextField(controller: nameController),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
