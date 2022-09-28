import 'package:rebase/base/network/dio/networks.dart';
import 'package:rebase/config/configs.dart';

import '../../../base/network/models/base_data.dart';

abstract class ILoginRepository {
  Future<BaseData>? login({required String phone, required String name}) {
    return null;
  }
}

class LoginRepository implements ILoginRepository {
  final ApiClient apiClient;

  LoginRepository(this.apiClient);

  @override
  Future<BaseData>? login({required String phone, required String name}) async {
    final res = await apiClient.get(ApiConfig.SUMMARY);
    return BaseData.fromJson(res.data, (json) => null);
  }
}
