import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/core/utils/data_parser.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/additions_pages/user/user_cubit.dart';
import 'package:sport_app/presentation/pages/edit_profile/cubit/editing_profile_cubit.dart';
import 'package:sport_app/presentation/pages/edit_profile/widget/avatar_picker.dart';
import 'package:sport_app/presentation/pages/edit_profile/widget/custom_tile.dart';
import 'package:sport_app/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:sport_app/presentation/widgets/action_button.dart';
import 'package:sport_app/presentation/widgets/default_input_text_field.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';

class EditingProfilePage extends StatefulWidget {
  final ProfileCubit profileCubit;

  const EditingProfilePage({super.key, required this.profileCubit});

  @override
  State<EditingProfilePage> createState() => _EditingProfilePageState();
}

class _EditingProfilePageState extends State<EditingProfilePage> {
  DateTime? _userDOB;
  File? avatarFile;

  final TextEditingController _fullNameTextEditingController = TextEditingController();
  final TextEditingController _dobTextEditingController = TextEditingController();

  final FocusNode _fullName = FocusNode();
  final FocusNode _dob = FocusNode();

  @override
  void dispose() {
    _fullNameTextEditingController.dispose();
    _dobTextEditingController.dispose();
    _fullName.dispose();
    _dob.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final userData = injector<UserCubit>().state.user;
    _userDOB = userData?.dateOfBirth;
    _fullNameTextEditingController.text = userData?.fullname ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditingProfileCubit()..setUser(injector<UserCubit>().state.user!),
      child: ScaffoldWithAppBar(
        appBarTitle: 'Edit your profile',
        child: SingleChildScrollView(
          child: BlocConsumer<EditingProfileCubit, EditingProfileState>(
            listener: (context, state) {
              if (state.successMessage != null) {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                scaffoldMessenger.showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(milliseconds: 1500),
                    content: Text(
                      state.successMessage!,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Theme.of(context).colorScheme.background),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.outline,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AvatarPicker(
                      avatarImage: state.user?.avatar,
                      onSelect: (File file) async {
                        avatarFile = file;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DefaultInputTextField(
                      focusNode: _fullName,
                      error: state.nameError,
                      textEditingController: _fullNameTextEditingController,
                      hintText: 'Full name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
                    child: CustomTileWidget(
                      label: 'Date of birth',
                      title: _userDOB != null ? DateParser.formatServerTime(_userDOB.toString()) : 'Your Birth data',
                      icon: IconButton(
                          icon: SvgPicture.asset(AppSvg.calendar),
                          onPressed: () async {
                            DateTime? selectedDate = await DateParser.showDataPicker(context);
                            setState(() {
                              _userDOB = selectedDate;
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 5.0, right: 5.0),
                    child: ActionButton(
                      isLoading: state.isLoading,
                      title: 'Save',
                      onPressed: () async {
                        await context
                            .read<EditingProfileCubit>()
                            .saveData(
                              user: state.user!.copyWith(
                                fullname: _fullNameTextEditingController.text,
                                dateOfBirth: _userDOB,
                              ),
                              avatar: avatarFile,
                            )
                            .then((value) => widget.profileCubit.getProfile());
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
