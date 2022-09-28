import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rebase/base/network/dio/networks.dart';

import '../shared/local_data/index.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiClient>(ApiClient(Dio()), permanent: true);
    Get.lazyPut<LocalStorage>(() => LocalStorageImpl());
  }
}
