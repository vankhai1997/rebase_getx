import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/configs.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget? body;
  final bool hasTabBar;
  final bool? hasBackgroundImage;
  final bool? addKey;
  final bool? resizeToAvoidBottomInset;
  final String? backgroundImage;
  final bool? hasDismissKeyboard;
  final bool? marginTop;
  final bool? isFull;
  final bool? isBottom;
  final Widget? bottomNavigation;
  final bool extendBodyBehindAppBar;
  final Color backgroundColor;
  final Function(bool)? showFloat;
  final Function(bool)? onScroll;

  const BaseScaffold({
    Key? key,
    this.appBar,
    this.marginTop,
    this.addKey,
    this.isBottom,
    this.backgroundImage,
    this.backgroundColor = Colors.white,
    this.hasBackgroundImage,
    this.isFull,
    this.extendBodyBehindAppBar = false,
    this.hasDismissKeyboard,
    this.body,
    this.bottomNavigation,
    this.resizeToAvoidBottomInset,
    this.showFloat,
    this.onScroll,
    this.hasTabBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor,
      appBar: appBar == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(
                AppBar().preferredSize.height +
                    (hasTabBar ? kToolbarHeight.h : 0),
              ),
              child: appBar!,
            ),
      body: Stack(
        children: [
          if ((hasBackgroundImage ?? false) &&
              (backgroundImage ?? "").isNotEmpty)
            Container(
              height: ScreenUtilsConfig.designHeight,
              width: ScreenUtilsConfig.designWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.fill,
                ),
              ),
            )
          else
            const SizedBox.shrink(),
          SafeArea(
            top: false,
            bottom: isBottom ?? true,
            child: Padding(
              padding: EdgeInsets.only(
                top: appBar == null && !(isFull ?? false)
                    ? MediaQuery.of(context).padding.top
                    : 0,
              ),
              child: body ?? const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
