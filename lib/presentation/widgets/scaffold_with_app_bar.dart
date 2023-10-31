import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/presentation/widgets/svg_button.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  final String appBarTitle;
  final Widget? child;
  final List<Widget>? actions;
  final Color? systemNavigationBarColor;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Brightness? systemNavigationBarIconBrightness;
  final bool? isNeedUpdateAfterPop;
  final String? leadingAsset;
  final Function()? beforePop;
  final bool canPop;

  const ScaffoldWithAppBar({
    super.key,
    required this.appBarTitle,
    required this.child,
    this.systemNavigationBarColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.systemNavigationBarIconBrightness,
    this.actions,
    this.isNeedUpdateAfterPop,
    this.canPop = true,
    this.leadingAsset,
    this.beforePop,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).appBarTheme.systemOverlayStyle!.copyWith(
            statusBarColor: statusBarColor ?? Theme.of(context).appBarTheme.systemOverlayStyle?.statusBarColor,
            statusBarIconBrightness:
                statusBarIconBrightness ?? Theme.of(context).appBarTheme.systemOverlayStyle?.statusBarIconBrightness,
            systemNavigationBarColor:
                systemNavigationBarColor ?? Theme.of(context).appBarTheme.systemOverlayStyle?.systemNavigationBarColor,
            systemNavigationBarIconBrightness: systemNavigationBarIconBrightness ??
                Theme.of(context).appBarTheme.systemOverlayStyle?.systemNavigationBarIconBrightness,
          ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0.0,
          leading: (canPop)
              ? Center(
                  child: SvgButton(
                    height: 24.0,
                    asset: leadingAsset ?? AppSvg.startIcon,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    onTap: () {
                      if (beforePop != null) {
                        beforePop!();
                      }

                      context.canPop() ? context.pop(isNeedUpdateAfterPop) : context.go(AppRoutes.search);
                    },
                  ),
                )
              : null,
          actions: actions,
          title: Text(
            appBarTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: false,
        ),
        body: child ?? const Placeholder(),
      ),
    );
  }
}
