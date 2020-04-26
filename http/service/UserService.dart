import '../model/User.dart';

class UserService{

  User getUserById(BigInt id){
    return new User("测试",23);
  }
}