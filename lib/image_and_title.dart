import 'package:flutter/material.dart';

class ImageAndTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const ImageAndTitle({super.key, required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 25),
          SizedBox(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: Text(title),
          ),
          Center(
            child: Text(
              subtitle,
            ),
          ),
          const SizedBox(height: 25.0),
      ],
    );
  }
}