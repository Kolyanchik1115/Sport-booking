import 'package:flutter/material.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/svg_button.dart';

class FavoriteContainer extends StatelessWidget {
  final bool isFavorite;
  final Function() onIconTap;

  const FavoriteContainer({
    required this.isFavorite,
    required this.onIconTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20.0,
      right: 20.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.background,
        ),
        child: SvgButton(
          asset: isFavorite ? AppSvg.heart : AppSvg.emptyHeart,
          color: Theme.of(context).colorScheme.primary,
          onTap: onIconTap,
        ),
      ),
    );
  }
}
