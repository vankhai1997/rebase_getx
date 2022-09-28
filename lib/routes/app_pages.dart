import 'package:get/get.dart';
import 'package:rebase/features/login/presentation/view/login_screen.dart';

import '../features/login/di/login_bindings.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      maintainState: true,
      page: () => const LoginScreen(),
      transition: Transition.cupertino,
      binding: LoginBindings(),
    ),
  ];
}
