import 'package:mobx/mobx.dart';

import '../../models/user_model/user_model.dart';
import '../../utils/auth_utils.dart';
import '../../utils/storage_utils.dart';
import '../store.dart';

part 'auth_state.g.dart';

class AuthState = _AuthState with _$AuthState;

abstract class _AuthState with Store {
  @observable
  UserModel? _currentUser;

  @computed
  UserModel? get currentUser => _currentUser;

  @computed
  set currentUser(UserModel? user) {
    _currentUser = user;
  }

  @action
  Future<String?> login(Map<String, dynamic> data) async {
    final user = UserModel.fromJson(data);
    if (await AuthUtils.correctUserData(user)) {
      currentUser = UserModel.fromJson(await AuthUtils.getCurrentUser());
    } else {
      return throw "User doesn't exist.";
    }
    return null;
  }

  @action
  Future<String> signUp(Map<String, dynamic> data) async {
    await AuthUtils.clear();
    final user = UserModel.fromJson(data);
    return await AuthUtils.isExistUser(user)
        ? throw 'User already exist.'
        : await AuthUtils.saveUser(user);
  }

  @action
  Future<void> setCurrentUser() async {
    currentUser = UserModel.fromJson(await AuthUtils.getCurrentUser());
  }

  Future<void> _cleanUserData() async {
    await Future.wait([StorageUtils.removeAccessToken()]);
    await Future.wait([AuthUtils.removeCurrentUser()]);

    reRegisterStoreGetIt();
  }

  @action
  Future<void> logout() async {
    await _cleanUserData();
  }

  @action
  String? validatePassword(String value) {
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'The password must contain \n one uppercase \n one lowercase \n one number \n one special character \n and be at least 8 in length.';
      } else {
        return null;
      }
    }
  }
}
