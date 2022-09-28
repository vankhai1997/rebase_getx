import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

mixin SmartLoadList {
  final refreshController = RefreshController();

  void onLoading() {}

  void onRefresh() {}

  Widget get listViewLoad;

  Expanded buildSmartListExpanded(
          {bool? enablePullDown,
          bool? enablePullUp,
          ScrollController? scrollController}) =>
      Expanded(
        child: SmartRefresher(
          scrollController: scrollController,
          controller: refreshController,
          header: buildHeaderSmartRefresh(),
          footer: buildFooterSmartRefresh(),
          enablePullDown: enablePullDown ?? true,
          enablePullUp: enablePullUp ?? false,
          onLoading: onLoading,
          onRefresh: onRefresh,
          child: listViewLoad,
        ),
      );

  SmartRefresher buildSmartList(
          {bool? enablePullDown,
          bool? enablePullUp,
          ScrollController? scrollController}) =>
      SmartRefresher(
        scrollController: scrollController,
        controller: refreshController,
        enablePullDown: enablePullDown ?? true,
        enablePullUp: enablePullUp ?? false,
        onLoading: onLoading,
        onRefresh: onRefresh,
        header: buildHeaderSmartRefresh(),
        footer: buildFooterSmartRefresh(),
        child: listViewLoad,
      );
}

Widget buildHeaderSmartRefresh() {
  return Platform.isIOS
      ? const ClassicHeader(
          releaseText: 'Đang tải',
          refreshingText: 'Đang tải',
          completeText: '',
          failedText: 'Đã có lỗi xảy ra',
          idleText: 'Đang tải',
          refreshingIcon: CupertinoActivityIndicator(),
        )
      : const MaterialClassicHeader();
}

Widget buildFooterSmartRefresh() {
  return const ClassicFooter(
    idleText: "",
    idleIcon: SizedBox(),
    loadingText: 'Đang tải',
    noDataText: 'Cuối trang',
    failedText: 'Đã có lỗi xảy ra',
    canLoadingText: 'Đang tải',
    loadingIcon: CupertinoActivityIndicator(),
  );
}
