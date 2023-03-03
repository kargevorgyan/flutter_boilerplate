import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model/user_model.dart';
import 'storage_utils.dart';

class Preferences {
  Preferences._();

  static List<UserModel> users = [];
  static UserModel currentUser = Null as UserModel;
}

class AuthUtils {
  static Future<SharedPreferences> get sharedInstance =>
      SharedPreferences.getInstance();

  static Future<List<String>?> getUsers() {
    return _readList('users');
  }

  static Future getCurrentUser() async {
    return _read('currentUser');
  }

  static Future removeCurrentUser() {
    return _remove('currentUser');
  }

  static Future<bool> isExistUser(UserModel user) async {
    final users = await getUsers();
    late UserModel decodedUser;
    late var userExist = false;
    users?.forEach(
          (u) => {
        decodedUser = UserModel.fromJson(json.decode(u)),
        if (decodedUser.username == user.username ||
            decodedUser.email == user.email)
          {
            userExist = true,
          }
      },
    );
    return userExist;
  }

  static Future<bool> correctUserData(UserModel user) async {
    final users = await getUsers();
    late UserModel decodedUser;
    late var correctData = false;
    users?.forEach(
      (u) => {
        decodedUser = UserModel.fromJson(json.decode(u)),
        if (decodedUser.username == user.username &&
            decodedUser.password == user.password)
          {
            correctData = true,
          }
      },
    );
    if (correctData) {
      await StorageUtils.setAccessToken('authToken');
      await _saveCurrentUser(decodedUser);
    } else {
      await StorageUtils.removeAccessToken();
      await _remove('currentUser');
    }
    return correctData;
  }

  static Future<String> saveUser(UserModel user) async {
    return _saveUser(user);
  }

  static Future<void> clear() async {
    return _clear();
  }

  /// Private helper functions
  static Future<List<String>?> _readList<T>(String key) async {
    final prefs = await sharedInstance;
    final value = prefs.getStringList(key);
    return value;
  }

  static Future<T?> _read<T>(String key) async {
    final prefs = await sharedInstance;
    final value = prefs.getString(key);
    return value == null ? null : json.decode(value) as T;
  }

  static Future<String> _saveUser(UserModel value) async {
    final prefs = await sharedInstance;
    var users = prefs.getStringList('users');
      users ??= [];
      users.add(json.encode(value));
    await prefs.setStringList('users', users);
    return 'User created successfully.';
  }

  static Future<void> _saveCurrentUser(UserModel value) async {
    final prefs = await sharedInstance;
    await prefs.setString('currentUser', json.encode(value));
  }

  static Future<void> _remove(String key) async {
    final prefs = await sharedInstance;
    await prefs.remove(key);
  }

  static Future<void> _clear() async {
    final prefs = await sharedInstance;
    await prefs.clear();
  }
}
