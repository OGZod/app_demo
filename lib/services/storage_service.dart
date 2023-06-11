import 'package:shared_preferences/shared_preferences.dart';

import '../values/constants.dart';

class StorageService{
  late final SharedPreferences _sharedPreferences;
  Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
  Future<bool> setBool(String key, bool value) async{
    return await _sharedPreferences.setBool(key,value);
  }
  Future<bool> setString(String key, String value) async{
    return await _sharedPreferences.setString(key,value);
  }
  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }

  bool getDeviceFirstOpen(){
    return _sharedPreferences.getBool(AppConstants.storageDeviceOpenFirstTime)??false;
  }
  bool getIsLoggedIn(){
    return _sharedPreferences.getString(AppConstants.storageUserTokenKey) == null?false:true;
  }
}