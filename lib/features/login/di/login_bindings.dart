import 'package:get/get.dart';
import 'package:rebase/features/login/presentation/controller/controlers.dart';
import 'package:rebase/features/login/repository/login_repository.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginRepository>(() => LoginRepository(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}
