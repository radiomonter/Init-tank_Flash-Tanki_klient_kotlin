package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.uid
{
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import projects.tanks.client.tanksservices.model.notifier.uid.UidNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   
   public class UidNotifierModel implements UserRefresh
   {
      
      private var data:Dictionary = new Dictionary();
      
      public function UidNotifierModel()
      {
         super();
      }
      
      public function setUid(_arg_1:Vector.<UidNotifierData>) : void
      {
         var _local_2:UidNotifierData = null;
         for each(_local_2 in _arg_1)
         {
            this.setAndUpdateConsumer(_local_2);
         }
      }
      
      private function setAndUpdateConsumer(_arg_1:UidNotifierData) : void
      {
         var _local_2:UserInfoConsumer = null;
         var _local_3:String = _arg_1.userId;
         this.data[_local_3] = _arg_1.uid;
         var _local_4:UserNotifier = UserNotifier(OSGi.getInstance().getService(UserNotifier));
         if(_local_4.hasDataConsumer(_local_3))
         {
            _local_2 = _local_4.getDataConsumer(_local_3);
            _local_2.setUid(_arg_1.uid);
         }
      }
      
      public function refresh(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         if(_arg_1 in this.data)
         {
            _arg_2.setUid(this.data[_arg_1]);
         }
      }
      
      public function remove(_arg_1:String) : void
      {
         delete this.data[_arg_1];
      }
   }
}

