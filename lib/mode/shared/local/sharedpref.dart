import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences ?sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static Future<bool> putBoolean({//هنعوز نجط داتا في ضغطة الزرار ف هنحتاج نروح للchange mood في الcubit ونغير
    required String key,
    required bool value,
  }) async
  {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getBoolean({
    required String key,
  })
  {
    return sharedPreferences?.getBool(key);

  }
}