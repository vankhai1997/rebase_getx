import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rebase/shared/event_bus/event_bus_utils.dart';
import 'package:rebase/shared/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

import '../shared/shareds.dart';
import 'network/models/base_data.dart';

class BaseController<T> extends GetxController {
  final T? arguments = Get.arguments == null ? null : Get.arguments as T;
  final compositeSubscription = CompositeSubscription();
  final erb = BehaviorSubject<Object>();
  final erbStr = BehaviorSubject<String>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _listenEventBus();
    _listenErrorEvent();
    super.onReady();
  }

  void _listenEventBus() {
    EventBusUtils.listenEvent().listen((event) {
      listenEventBus(event);
    }).addTo(compositeSubscription);
  }

  void _listenErrorEvent() {
    erb.listen((error) {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.connectTimeout:
            SnackBarUtils.showError('Đã có lỗi xảy ra');
            break;
          case DioErrorType.sendTimeout:
            SnackBarUtils.showError('Đã có lỗi xảy ra');
            break;
          case DioErrorType.receiveTimeout:
            SnackBarUtils.showError('Đã có lỗi xảy ra');
            break;
          case DioErrorType.response:
            final code = error.response?.statusCode;
            final msg = error.response?.statusMessage;
            onErrorController(msg ?? "");
            break;
          case DioErrorType.cancel:
            SnackBarUtils.showError('Đã có lỗi xảy ra');
            break;
          case DioErrorType.other:
            SnackBarUtils.showError('Đã có lỗi xảy ra');
            break;
        }
        return;
      }
      onErrorController(error.toString());
    }).addTo(compositeSubscription);
    erbStr.listen((value) {
      onErrorController(value);
    }).addTo(compositeSubscription);
  }

  @override
  void onClose() {
    compositeSubscription.dispose();
    super.onClose();
  }

  void onErrorController(String meta) {}

  void listenEventBus(dynamic data) {}
}

extension FutureExtensions<T> on Future<T> {
  Future<T?> onDioCatchError(BehaviorSubject<Object> erb) async {
    return catchError((Object error) {
      if (!erb.isClosed) {
        erb.add(error);
      }
      Logger.write('$error');
      throw Exception(error);
    });
  }
}
