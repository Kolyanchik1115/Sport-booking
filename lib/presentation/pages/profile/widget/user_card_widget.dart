import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:sport_app/presentation/widgets/svg_button.dart';
import 'package:sport_app/presentation/widgets/user_avatar_widget.dart';

class UserCardWidget extends StatelessWidget {
  final UserData user;

  const UserCardWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              UserCircleAvatar(
                avatarRadius: 50.0,
                avatarPath: user.avatar,
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.fullname ?? 'Anonymous',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      user.email ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22.0),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -40),
                child: SvgButton(
                  width: 23,
                  asset: AppSvg.pencil,
                  onTap: () => context.push(AppRoutes.editProfile, extra: context.read<ProfileCubit>()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
