import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:sport_app/presentation/pages/profile/widget/user_card_widget.dart';
import 'package:sport_app/presentation/widgets/button_tile_widget.dart';
import 'package:sport_app/presentation/widgets/custom_error_widget.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';
import 'package:sport_app/presentation/widgets/switch_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator();
          } else if (state.errorMessage != null) {
            return CustomErrorWidget(errorMessage: state.errorMessage!);
          }
          return EmptyLayout(
            background: Theme.of(context).colorScheme.onSurface,
            child: ListView(
              children: [
                Column(
                  children: [
                    UserCardWidget(
                      onTap: () {},
                      user: state.user!,
                    ),
                    ButtonTile(
                      icon: AppSvg.fingerprint,
                      title: 'Privacy',
                      onPressed: () {},
                      color: Theme.of(context).colorScheme.shadow,
                      subtitle: 'Read the privacy policy',
                    ),
                    ButtonTile(
                      icon: AppSvg.moon,
                      title: 'Dark mode',
                      color: Theme.of(context).colorScheme.shadow,
                      toggle: AppSwitch(isChecked: false, onChanged: (value) {}),
                      containsSwitch: true,
                      subtitle: 'Automatic',
                    ),
                    ButtonTile(
                      icon: AppSvg.about,
                      title: 'About',
                      onPressed: () {},
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      subtitle: 'Learn more about Sport App',
                    ),
                    ButtonTile(
                      icon: AppSvg.message,
                      title: 'Send Feedback',
                      onPressed: () {},
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      subtitle: 'Let us know about your problem',
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Account',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ButtonTile(
                            padding: EdgeInsets.zero,
                            icon: AppSvg.signOut,
                            title: 'Sign Out',
                            onPressed: () => context.read<ProfileCubit>().logout(),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          ButtonTile(
                            padding: const EdgeInsets.only(top: 5.0),
                            icon: AppSvg.change,
                            title: 'Change Email',
                            onPressed: () {},
                            color: Theme.of(context).colorScheme.background,
                          ),
                          ButtonTile(
                            padding: const EdgeInsets.only(top: 5.0),
                            icon: AppSvg.trash,
                            title: 'Delete account',
                            onPressed: () {},
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
