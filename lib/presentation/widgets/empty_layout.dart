import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmptyLayout extends StatelessWidget {
  final Widget child;
  final Color? background;
  final Color? bottomBarColor;
  final Color? systemNavigationBarColor;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Brightness? systemNavigationBarIconBrightness;

  const EmptyLayout({
    super.key,
    required this.child,
    this.background,
    this.bottomBarColor,
    this.systemNavigationBarColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.systemNavigationBarIconBrightness,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).appBarTheme.systemOverlayStyle!.copyWith(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      ),
      child: Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.paddingOf(context).top),
          child: SizedBox(
            height: MediaQuery.paddingOf(context).top,
          ),
        ),
        bottomNavigationBar: ColoredBox(
          color: bottomBarColor ?? Theme.of(context).colorScheme.background,
          child: SizedBox(height: MediaQuery.paddingOf(context).bottom),
        ),
        resizeToAvoidBottomInset: true,
        body: child,
      ),
    );
  }
}
