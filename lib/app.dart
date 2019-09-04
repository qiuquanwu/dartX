import 'dart:io';
import 'route.dart';
import 'router.dart';
class App{
  Router router;
  App(router){
    this.router=router;
  }
  handleGet( HttpRequest request){
    var uri=request.uri.toString();
    var routes=router.GetRoutes();
    print("routes:"+routes.length.toString());
    for (Route route in routes){
      var curi=route.uri;
      var method=route.method;
        if( curi == uri && method=='GET'){ 
          //只要单独中间件存在
            handle(route,request);
            break;
        }
    }    
  }
  handle(route,request){
            //只要单独中间件存在
    if(route.middleware!=null){
      print("使用单独中间件");
      route.middleware.handle(request,route.callBackfunc);
    }else if(router.middleware!=null){
      //全局中间件存在，单独中间件不存在
      print("使用全局中间件");
      router.middleware.handle(request,route.callBackfunc);
    }else{
      print("未使用中间件");
      route.callBackfunc(request,request.response);
    }

  }
  handlePost(HttpRequest request){
   var uri=request.uri.toString();
   var routes=router.GetRoutes();
    print("routes:"+routes.length.toString());
    for (Route route in routes){
      var curi=route.uri;
      var method=route.method;
        if( curi == uri && method=='POST'){    
            handle(route,request);
            break;
        }
    }
    
  }
  handleRequest( HttpRequest request){
    try {
      if (request.method == 'GET') {
        handleGet(request);
      } else {
        handlePost(request);
      }
    } catch (e) {
      print('Exception in handleRequest: $e');
    }
    print('Request handled.');
  }
  void listen (int port) async{
      var requestServer = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, port);
      print('服务已经启动，请打开浏览器输入http://127.0.0.1:4040');
      await for (HttpRequest request in requestServer) {
        handleRequest(request);
      }
  }

}
