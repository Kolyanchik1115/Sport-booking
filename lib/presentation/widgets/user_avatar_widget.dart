import 'package:flutter/material.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    super.key,
    required this.avatarPath,
    this.avatarRadius = 16.0,
  });

  final String? avatarPath;
  final double? avatarRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        foregroundImage: NetworkImage(avatarPath ?? 'https://www.w3schools.com/howto/img_avatar.png'),
        radius: avatarRadius,
      ),
    );
  }
}
