import 'package:rebase/base/base_controller.dart';

import '../../repository/login_repository.dart';

class LoginController extends BaseController {
  final ILoginRepository loginRepository;

  LoginController(this.loginRepository);

  @override
  void onInit() {
    login();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> login() async {
    final res = await loginRepository
        .login(phone: 'phone', name: 'name')!
        .onDioCatchError(erb);
    print('=====${res}');
  }
}
