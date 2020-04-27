import '../core/middleware.dart';
import '../core/router.dart';
import '../core/Context.dart';
import '../http/controller/HomeController.dart';

Router routeInit() {
  //声明中间件router
  Middleware middleware = new Middleware((request, next) => {
        //print("全局中间件"),
        print(123),
        next(new Context(request))
      });
  Router router = new Router();
  /**处理get请求 */
  router.GET('/', HomeController.index);
  //使用单独中间件的路由

  router.use(middleware);

  return router;
}
