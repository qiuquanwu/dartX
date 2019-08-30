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