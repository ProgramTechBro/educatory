import 'package:shared_preferences/shared_preferences.dart';
import '../../config/app_keys.dart';

class LocalStorageService {
  Future<bool> isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppKeys.onboardingComplete) ?? false;
  }

  Future<void> setOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppKeys.onboardingComplete, true);
  }
}
