import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  // User's default display name when joining a game
  static const defaultDisplayNameKey = 'defaultDisplayName';

  // Set user's default display name
  Future<void> setDefaultDisplayName(String name) async {
    await sharedPreferences.setString(defaultDisplayNameKey, name);
  }

  // Get user's default display name
  String? getDefaultDisplayName() =>
      sharedPreferences.getString(defaultDisplayNameKey);
}
