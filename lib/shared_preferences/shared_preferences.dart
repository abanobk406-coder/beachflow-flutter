import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils{



 static Future<bool> setToken({required String key,required String value})async{
    SharedPreferences prefs=await SharedPreferences.getInstance();

   return prefs.setString(key, value);
  }

   
   static  Future<String?> getToken({required String key})async{
    SharedPreferences prefs=await SharedPreferences.getInstance();

    return prefs.getString(key);
  }


  static  Future<bool> deleteToken({required String key})async{
    SharedPreferences prefs=await SharedPreferences.getInstance();

   return prefs.remove(key);
  } 


}