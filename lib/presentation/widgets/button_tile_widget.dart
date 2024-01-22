import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/core/themes/app_assets.dart';

class ButtonTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? customText;
  final String icon;
  final Color color;
  final EdgeInsetsGeometry padding;
  final bool containsSwitch;
  final Widget? toggle;
  final Function()? onPressed;

  const ButtonTile({
    Key? key,
    required this.icon,
    this.title,
    this.customText,
    this.subtitle,
    this.onPressed,
    required this.color,
    this.containsSwitch = false,
    this.toggle,
    this.padding = const EdgeInsets.all(10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: Container(
          height: 90.0,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(icon),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              customText != null
                  ? Text(customText!, style: Theme.of(context).textTheme.bodyMedium):
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(title ?? '', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Text(subtitle ?? '', style: Theme.of(context).textTheme.titleLarge?.
                  copyWith(color: Theme.of(context).colorScheme.secondary)),
                ],
              ),
              const Spacer(),
              containsSwitch
                  ? toggle ?? const SizedBox()
                  : SvgPicture.asset(AppSvg.arrowRight, height: 35.0, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(width: 12.0)
            ],
          ),
        ),
      ),
    );
  }
}
