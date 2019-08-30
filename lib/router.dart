import 'route.dart';
/**路由器 */
class Router{
  List<Route> routes=[];
  Router(){
  }
  /**post方法 */
  post(uri,fn){
    var route=new Route('POST',uri,fn);
    addf(route);
  }
  /**get方法 */
  getf(uri,fn){
    var route=new Route('GET',uri,fn);
    addf(route);
  }
  /**添加路由节点 */
  addf(route){
    routes.add(route);
  }
}