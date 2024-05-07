import 'package:flutter/material.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/injector.dart';

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
        foregroundImage: avatarPath != null
            ? NetworkImage(injector<SportAppApi>().imageFromDB(
                avatarPath!,
              ))
            : const NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
        radius: avatarRadius,
      ),
    );
  }
}
