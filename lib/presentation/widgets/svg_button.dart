import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;
  final Color? color;
  final Function() onTap;

  const SvgButton({
    super.key,
    required this.asset,
    this.height,
    this.width,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        asset,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}
