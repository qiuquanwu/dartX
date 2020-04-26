
import '../core/middleware.dart';
import '../core/router.dart';
Router routeInit(){
  //声明中间件router
  Middleware middleware1=new Middleware((request,next)=>{
      //print("全局中间件"),
      next(request,request.response)
  });

    Middleware middleware2=new Middleware((request,next)=>{
      //print("单独中间件"),
      next(request,request.response)
  });
  Router router=new Router();
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