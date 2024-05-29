import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareButton extends StatelessWidget {
  final String title;
  final String assets;
  final Function() onTap;

  const ShareButton({
    super.key,
    required this.title,
    required this.assets,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(assets),
          const SizedBox(height: 4.0),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
