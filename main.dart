import 'lib/app.dart';
import 'route/routeList.dart';
main(){
  var router=routeInit();
  print(router.GetRoutes().length);
  var app=new App(router);
  app.listen(4040);
}
