import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';

class AppbarWidget<T> extends StatelessWidget {
  final String? title;
  final String? leadingIcon;
  final bool? hasLeading;
  final T? result;
  final Color? leadingColor;
  final Color? textColor;
  final List<Widget>? actionWidget;
  final Function()? onTapLeader;
  final Color? backgroundColor;
  final double? elevation;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Widget? leadingWidget;

  const AppbarWidget(
      {Key? key,
      this.title,
      this.leadingIcon,
      this.onTapLeader,
      this.actionWidget,
      this.backgroundColor,
      this.elevation,
      this.systemUiOverlayStyle,
      this.leadingWidget,
      this.hasLeading,
      this.result,
      this.leadingColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 0.7,
      systemOverlayStyle: systemUiOverlayStyle ?? SystemUiOverlayStyle.light,
      leading: leadingWidget ??
          Visibility(
            visible: hasLeading ?? false,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                if (onTapLeader != null) {
                  onTapLeader!();
                } else {
                  Get.back(result: result);
                }
              },
              child: leadingIcon != null
                  ? SvgPicture.asset(
                      leadingIcon!,
                      color: leadingColor ?? Colors.white,
                      fit: BoxFit.cover,
                    )
                  : Assets.images.icProfile.svg(),
            ),
          ),
      title: Text(
        title ?? "",
      ),
      actions: actionWidget,
      centerTitle: true,
    );
  }
}
