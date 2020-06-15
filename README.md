## dart版express http_server服务框架。
- 灵感来源express,koa2,laravel
- 入口文件 main.dart
- 2019-09-05 添加路由中间件支持，支持全局中间件和单独路由中间件
```dart
import 'core/app.dart';
import 'core/router.dart';
import 'routes/routeList.dart';

void main() {
  ///初始化路由
  Router router = routeInit();
  App app = new App(router);
  app.listen(4040);
}

```
- 路由入口 route/routeList.dart
```dart
import '../core/middleware.dart';
import '../core/router.dart';
import '../core/Context.dart';
import '../http/controller/HomeController.dart';

Router routeInit() {
  //声明中间件router
  Middleware middleware = new Middleware((request, next) => {
        //print("全局中间件"),
        //print(123),
        next(new Context(request))
      });
  Router router = new Router();
  /**处理get请求 */
  router.GET('/', HomeController.index);
  //使用单独中间件的路由

  router.use(middleware);

  return router;
}

```
- 控制器 /http/HomeController.dart
```dart
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

```
### 使用方法
1.下载安装
```shell
git clone https://github.com/qiuquanwu/dartX.git
```
2.启动服务
```shell
dart main.dart
```
3.打开浏览器访问localhost:4040

