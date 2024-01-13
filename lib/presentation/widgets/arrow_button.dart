import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/app_assets.dart';

class ArrowButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final Function() onTap;

  const ArrowButton({
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            Container(
              width: 36.0,
              height: 36.0,
              margin: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: isLoading
                  ? Center(
                      child: SizedBox(
                        height: 16.0,
                        width: 16.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    )
                  : SvgPicture.asset(
                      AppSvg.arrow,
                      height: 24.0,
                      width: 24.0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
