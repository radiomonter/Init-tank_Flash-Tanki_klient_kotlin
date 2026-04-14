package projects.tanks.clients.fp10.libraries.tanksservices.model.listener
{
   import alternativa.osgi.OSGi;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class UserNotifierModel implements UserNotifier
   {
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      public function UserNotifierModel()
      {
         super();
         this.objectLoaded();
      }
      
      public function subcribe(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         this.refresh(_arg_1,_arg_2);
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;subscribe_user_update;" + _arg_1);
      }
      
      public function refresh(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         Lobby.keduh.refresh(_arg_1,_arg_2);
         Lobby.rypyq.refresh(_arg_1,_arg_2);
         Lobby.fej.refresh(_arg_1,_arg_2);
         Lobby.rowebatoz.refresh(_arg_1,_arg_2);
      }
      
      public function unsubcribe(_arg_1:Vector.<String>) : void
      {
         var _local_2:String = null;
         for each(_local_2 in _arg_1)
         {
            UserRefresh(OSGi.getInstance().getService(UserRefresh)).remove(_local_2);
            Network(OSGi.getInstance().getService(INetworker)).send("lobby;unsubscribe_user_update;" + _local_2);
         }
      }
      
      public function hasDataConsumer(_arg_1:String) : Boolean
      {
         return userInfoService.hasConsumer(_arg_1);
      }
      
      public function getDataConsumer(_arg_1:String) : UserInfoConsumer
      {
         return userInfoService.getConsumer(_arg_1);
      }
      
      public function objectLoaded() : void
      {
         userInfoService.init();
      }
      
      public function objectUnloaded() : void
      {
         userInfoService.unload();
      }
      
      public function getCurrentUserId() : String
      {
         var _local_1:IUserPropertiesService = OSGi.getInstance().getService(IUserPropertiesService) as IUserPropertiesService;
         return _local_1.userName;
      }
   }
}

