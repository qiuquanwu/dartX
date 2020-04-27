class User {
  int id = 1;
  String name;
  int age;
  User(String name, int age) {
    this.age = age;
    this.name = name;
  }
  Map toJson() {
    Map map = new Map();
    map["id"] = this.id;
    map["name"] = this.name;
    map["age"] = this.age;
    return map;
  }
}
