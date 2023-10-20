import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/themes/app_assets.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  final ValueNotifier<int> _index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Theme.of(context).appBarTheme.systemOverlayStyle!,
          child: ValueListenableBuilder(
            valueListenable: _index,
            builder: (BuildContext context, int currentIndex, Widget? child) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: _icon(AppSvg.startIcon, currentIndex == 0), label: 'Search'),
                  BottomNavigationBarItem(icon: _icon(AppSvg.startIcon, currentIndex == 1), label: 'Favorite'),
                  BottomNavigationBarItem(icon: _icon(AppSvg.startIcon, currentIndex == 2), label: 'Reservation'),
                  BottomNavigationBarItem(icon: _icon(AppSvg.startIcon, currentIndex == 3), label: 'Me'),
                ],
                currentIndex: widget.navigationShell.currentIndex,
                onTap: (int index) => _onTap(context, index),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    _index.value = index;

    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Widget _icon(String asset, bool isSelected) {
    return SvgPicture.asset(
      asset,
      height: 20.0,
      color: isSelected
          ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color
          : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color,
    );
  }
}
