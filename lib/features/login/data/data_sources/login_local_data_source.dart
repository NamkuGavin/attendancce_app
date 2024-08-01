import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../models/login_model.dart';

abstract class LoginLocalDataSource {
  Future<void> cacheLoginHistory(LoginModel model);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  const LoginLocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheLoginHistory(LoginModel model) {
    return sharedPreferences.setString(
      cachedBearerToken,
      model.token,
    );
  }
}
