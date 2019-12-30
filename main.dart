import 'lib/app.dart';
import 'route/routeList.dart';
main(){
  ///初始化路由
  Router router=routeInit();
  //打印注册路由的个数
  print(router.GetRoutes().length);
  //创建 App
  App app=new App(router);
  app.listen(4040);
}
