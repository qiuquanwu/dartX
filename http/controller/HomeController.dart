import '../../core/Context.dart';
import '../../http/model/User.dart';

class HomeController {
  static void userList(Context c) {
    String result = "123";
    c.JSON(result);
  }

  static void index(Context c) {
    User user = new User("小张", 23);

    c.JSON(user);
  }
}
