import 'package:flutter/material.dart';
import 'package:sport_app/presentation/widgets/user_avatar_widget.dart';

class UserCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? userName;
  final String? email;
  final String avatar;

  const UserCardWidget({
    super.key,
    this.onTap,
    required this.userName,
    required this.avatar,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserCircleAvatar(
                avatarRadius: 70.0,
                avatarPath: avatar,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName ?? 'Anonymous',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    email ?? 'Unknown',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
