import 'package:flutter/material.dart';

class UserPostDescription extends StatelessWidget {
  const UserPostDescription({
    super.key,
    required this.likes,
    required this.username,
    required this.description,
  });

  final List<dynamic> likes;
  final String username;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${likes.length} likes'),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$username: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
