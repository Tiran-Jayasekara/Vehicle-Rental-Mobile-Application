

import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class preferancePerson{
  Future saveSet(setting settings)async {
    final preferance = await SharedPreferences.getInstance();

    await preferance.setString('email', settings.email);
    print("save setting");
  }
  Future<setting> getSetting()async{
    final preferance = await SharedPreferences.getInstance();

    final gmail = preferance.getString('email');

    return setting(
      email : gmail,
    );

  }
}