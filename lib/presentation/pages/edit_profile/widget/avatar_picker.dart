import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/injector.dart';

class AvatarPicker extends StatefulWidget {
  final String? avatarImage;
  final Function(File file) onSelect;

  const AvatarPicker({super.key, this.avatarImage, required this.onSelect});

  @override
  AvatarPickerState createState() => AvatarPickerState();
}

class AvatarPickerState extends State<AvatarPicker> {
  File? _selectedImage;
  UserData? user;

  Future<void> _onPickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
      if (_selectedImage != null) {
        widget.onSelect(_selectedImage!);
      }
    }
  }

  ImageProvider _getAvatarImage() {
    if (_selectedImage != null) {
      return FileImage(_selectedImage!);
    } else if (widget.avatarImage != null) {
      return NetworkImage(injector<SportAppApi>().imageFromDB(
        widget.avatarImage ?? AppPng.emptyAvatar,
      ));
    } else {
      return const NetworkImage(AppPng.emptyAvatar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPickImage,
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 58.0,
                backgroundImage: _getAvatarImage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
