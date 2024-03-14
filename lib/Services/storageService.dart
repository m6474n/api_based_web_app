import 'package:shared_preferences/shared_preferences.dart';

class UseDetails{

  static SharedPreferences? preferences;

  static void init()async{
   preferences = await SharedPreferences.getInstance();
  }
  storeUserDetails(Map<String,dynamic> data){
    preferences!.setString("id", data['id']);
    preferences!.setString("username", data['id']);
    preferences!.setString("email", data['id']);
    preferences!.setString("phone", data['id']);
    preferences!.setString("address", data['id']);
    preferences!.setString("account", data['id']);
    preferences!.setString("bank", data['id']);
    preferences!.setString("type", data['id']);
    preferences!.setString("time", data['id']);
  }




}