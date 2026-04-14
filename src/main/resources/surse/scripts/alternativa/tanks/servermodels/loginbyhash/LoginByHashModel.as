package alternativa.tanks.servermodels.loginbyhash
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.service.IEntranceClientFacade;
   import flash.net.SharedObject;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import mx.utils.StringUtil;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class LoginByHashModel implements ILoginByHash
   {
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var storageService:IStorageService;
      
      public function LoginByHashModel()
      {
         super();
      }
      
      public function loginBySingleUseHash(_arg_1:String) : void
      {
      }
      
      public function loginByHash(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("auth;loginByHash;" + _arg_1);
      }
      
      public function loginBySingleUseHashFailed() : void
      {
         this.goToLoginHashFailed();
      }
      
      public function loginByHashFailed() : void
      {
         this.goToLoginHashFailed();
      }
      
      private function goToLoginHashFailed() : void
      {
         var _local_1:SharedObject = storageService.getStorage();
         var _local_2:SharedObject = storageService.getAccountsStorage();
         if(Boolean(_local_2.data[_local_1.data.userName]))
         {
            delete _local_2.data[_local_1.data.userName];
            _local_2.flush();
         }
         _local_1.data.userHash = null;
         clientFacade.goToLoginForm();
      }
      
      public function rememberUsersHash(_arg_1:String) : void
      {
         var _local_2:SharedObject = storageService.getStorage();
         _local_2.data.userHash = _arg_1;
         _local_2.flush();
      }
      
      public function rememberAccount(_arg_1:String) : void
      {
         var _local_5:String = null;
         this.rememberUsersHash(_arg_1);
         var _local_2:SharedObject = storageService.getStorage();
         if(StringUtil.trim(_local_2.data.userName).length == 0)
         {
            return;
         }
         var _local_3:SharedObject = storageService.getAccountsStorage();
         var _local_4:Object = {};
         for(_local_5 in _local_2.data)
         {
            _local_4[_local_5] = _local_2.data[_local_5];
         }
         _local_3.data[_local_2.data.userName] = _local_4;
         _local_3.flush();
      }
   }
}

