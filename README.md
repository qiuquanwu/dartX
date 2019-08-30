## dart版express http_server服务框架。
- 灵感来源express,koa2,laravel
- 入口文件 main.dart
```dart
    import 'lib/app.dart';
    import 'lib/router.dart';
    import 'route/routeList.dart';
    main(){
    var routes=routeInit();
    var app=new App(routes);
    app.listen(4040);
    }

```
- 路由入口 route/routeList.dart
```dart
    import '../lib/router.dart';
    routeInit(){
    var router=new Router();
    /**处理get请求 */
    router.getf('/',(req,res)=>{
        res..write('index')
        ..close()
    });
    router.getf('/home',(req,res)=>{
        res..write('home')
        ..close()
    });
    /**处理post请求 */
    router.post('/add',(req,res)=>{
        res..write('home')
        ..close()
    });
    return router.routes;
    }
```
### 使用方法
1.下载安装
```shell
git clone <项目地址>
```
2.启动服务
```shell
dart main.dart
```
3.打开浏览器访问localhost:4040

