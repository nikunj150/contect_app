import 'package:shared_preferences/shared_preferences.dart';

class Shrhelper{

  void setintrostatus()async
  {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool('intro', true);
  }

  Future<bool?> getintrostatus()async
  {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? status = await shr.getBool("intro");
    return status;
  }
}