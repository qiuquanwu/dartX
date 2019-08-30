import 'dart:io';
import 'dart:convert';
import 'route.dart';
class App{
  List<Route> routes=[];
  Function fn;
  App(routes){
    this.routes=routes;
  }
  handleGet( HttpRequest request){
    var uri=request.uri.toString();
    for (Route route in routes){
      var curi=route.uri;
      var method=route.method;
        if( curi == uri && method=='GET'){    
            fn=route.callBackfunc;
            fn(request,request.response);
            break;
        }else{
            print('request method not found!');
        }
    }
      
  }
  handlePost(HttpRequest request){
   var uri=request.uri.toString();
    for (Route route in routes){
      var curi=route.uri;
      var method=route.method;
        if( curi == uri && method=='POST'){    
            fn=route.callBackfunc;
            fn(request,request.response);
            break;
        }else{
             print('request method not found!');
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
