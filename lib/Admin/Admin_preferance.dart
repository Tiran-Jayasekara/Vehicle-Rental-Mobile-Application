
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/Admin/Admin_Login.dart';


class Adminpreferance{
  Future saveSetting(nesetting settings)async {
    final Adminpreferance = await SharedPreferences.getInstance();

    await Adminpreferance.setString('email', settings.email);
    print("save setting");
  }
  Future<nesetting> getSetting()async{
    final Adminpreferance = await SharedPreferences.getInstance();

    final gmail = Adminpreferance.getString('email');

    return nesetting(
      email : gmail,
    );

  }
}
