package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online
{
   import alternativa.osgi.OSGi;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   
   public class OnlineNotifierModel implements UserRefresh
   {
      
      [Inject]
      public static var onlineNotifierService:IOnlineNotifierService;
      
      public function OnlineNotifierModel()
      {
         super();
      }
      
      private static function convertToClientData(_arg_1:OnlineNotifierData) : ClientOnlineNotifierData
      {
         return new ClientOnlineNotifierData(_arg_1.userId,_arg_1.online,_arg_1.serverNumber);
      }
      
      public function setOnline(_arg_1:Vector.<OnlineNotifierData>) : void
      {
         var _local_2:ClientOnlineNotifierData = null;
         var _local_5:int = 0;
         var _local_3:Vector.<ClientOnlineNotifierData> = new Vector.<ClientOnlineNotifierData>(_arg_1.length);
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_2 = convertToClientData(_arg_1[_local_5]);
            this.setAndUpdateConsumer(_local_2);
            _local_3[_local_5] = _local_2;
            _local_5++;
         }
         onlineNotifierService.setOnline(_local_3);
      }
      
      private function setAndUpdateConsumer(_arg_1:ClientOnlineNotifierData) : void
      {
         var _local_2:UserInfoConsumer = null;
         var _local_3:String = _arg_1.userId;
         onlineNotifierService.addUserOnlineData(_arg_1);
         var _local_4:UserNotifier = UserNotifier(OSGi.getInstance().getService(UserNotifier));
         if(_local_4.hasDataConsumer(_local_3))
         {
            _local_2 = _local_4.getDataConsumer(_local_3);
            _local_2.setOnline(_arg_1.online,_arg_1.serverNumber);
         }
      }
      
      public function refresh(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         var _local_3:ClientOnlineNotifierData = null;
         if(onlineNotifierService.hasUserOnlineData(_arg_1))
         {
            _local_3 = onlineNotifierService.getUserOnlineData(_arg_1);
            _arg_2.setOnline(_local_3.online,_local_3.serverNumber);
         }
      }
      
      public function remove(_arg_1:String) : void
      {
         onlineNotifierService.removeUserOnlineData(_arg_1);
      }
   }
}

