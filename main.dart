import 'core/app.dart';
import 'core/router.dart';
import 'routes/routeList.dart';

void main() {
  ///初始化路由
  Router router = routeInit();
  App app = new App(router);
  app.listen(4040);
}
