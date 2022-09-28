import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String _envConfig(String flavor) {
    switch (flavor) {
      case 'dev':
        return 'assets/env/.env_dev';
      case 'staging':
        return 'assets/env/.env_staging';
      case 'production':
        return 'assets/env/.env_production';
      default:
        return 'assets/env/.env_dev';
    }
  }

  static Future<void> appConfig() async {
    WidgetsFlutterBinding.ensureInitialized();
    const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');
    await dotenv.load(
      fileName: _envConfig(flavor),
    );
  }
}
