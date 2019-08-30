/**单个路由实体类 */
class Route{
  String uri;//uri
  String method;//请求方法 'POST' 'GET'
  Function callBackfunc; //回调方法
  /*构造函数 */
  Route(String method,String uri, Function callBackfunc){
    this.uri=uri;
    this.method=method;
    this.callBackfunc=callBackfunc;
  }
}