import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';

class SeteUpAccountPage extends StatelessWidget {
  const SeteUpAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: '');
    void setUp() {
    }
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextField(controller: nameController),
            const SizedBox(height: 10.0),
            MainButton(text: "Set up", onPressed: setUp),
          ],
        ),
      ),
    );
  }
}
