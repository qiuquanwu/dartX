## dart版express http_server服务框架。
- 灵感来源express,koa2,laravel
- 入口文件 main.dart
- 2019-09-05 添加路由中间件支持，支持全局中间件和单独路由中间件
```dart
import 'lib/app.dart';
import 'route/routeList.dart';
main(){
  var router=routeInit();
  print(router.GetRoutes().length);
  var app=new App(router);
  app.listen(4040);
}


```
- 路由入口 route/routeList.dart
```dart

import '../lib/middleware.dart';
import '../lib/router.dart';
routeInit(){
  //声明中间件
  var middleware1=new Middleware((request,next)=>{
      print("全局中间件"),
      next(request,request.response)
  });

    var middleware2=new Middleware((request,next)=>{
      print("单独中间件"),
      next(request,request.response)
  });
  var router=new Router();
  /**处理get请求 */
  router.GET('/',(req,res)=>{
    res..write('index')
       ..close()
  });
  //使用单独中间件的路由
  router.GET('/home',(req,res)=>{
    res..write('home')
       ..close()
  },middleware: middleware2);
  /**处理post请求 */
  router.POST('/add',(req,res)=>{
    res..write('home')
       ..close()
  });
  //绑定全局中间件
  router.use(middleware1);
  
  return router;
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

