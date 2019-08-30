import 'lib/app.dart';
import 'lib/router.dart';
import 'route/routeList.dart';
main(){
  var routes=routeInit();
  var app=new App(routes);
  app.listen(4040);
}
