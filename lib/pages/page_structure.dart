import 'dart:io';
import 'dart:math' show pi;
import 'package:bringo_restaurants/pages/drawer_screen.dart';
import 'package:bringo_restaurants/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class PageStructure extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final Color backgroundColor;
  final double elevation;

  const PageStructure({
    Key key,
    this.title,
    this.child,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angle = ZoomDrawer.isRTL() ? 180 * pi / 180 : 0.0;
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    final container = Container(
      color: Colors.white,
      child: Center(
        child:
            Text("${"current"}: ${DrawerScreen.mainMenu[_currentPage].title}"),
      ),
    );
    return PlatformScaffold(
      backgroundColor: Colors.white,
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        android: (_) => MaterialAppBarData(elevation: elevation),
        title: PlatformText(
          DrawerScreen.mainMenu[_currentPage].title,
          style: TextStyle(
            letterSpacing: 1.5
          ),
        ),
        leading: Transform.rotate(
          angle: angle,
          child: PlatformIconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              ZoomDrawer.of(context).open();
            },
          ),
        ),
        trailingActions: actions,
      ),
      body: _currentPage==0 ? HomeScreen() : container,
    );
  }
}
