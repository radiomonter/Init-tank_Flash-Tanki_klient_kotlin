package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.rank
{
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import projects.tanks.client.tanksservices.model.notifier.rank.RankNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   
   public class RankNotifierModel implements UserRefresh
   {
      
      private var data:Dictionary = new Dictionary();
      
      public function RankNotifierModel()
      {
         super();
      }
      
      public function setRank(_arg_1:Vector.<RankNotifierData>) : void
      {
         var _local_2:RankNotifierData = null;
         for each(_local_2 in _arg_1)
         {
            this.setAndUpdateConsumer(_local_2);
         }
      }
      
      public function setAndUpdateConsumer(_arg_1:RankNotifierData) : void
      {
         var _local_2:UserInfoConsumer = null;
         var _local_3:String = _arg_1.userId;
         this.data[_local_3] = _arg_1.rank;
         var _local_4:UserNotifier = UserNotifier(OSGi.getInstance().getService(UserNotifier));
         if(_local_4.hasDataConsumer(_local_3))
         {
            _local_2 = _local_4.getDataConsumer(_local_3);
            _local_2.setRank(_arg_1.rank);
         }
      }
      
      public function refresh(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         if(_arg_1 in this.data)
         {
            _arg_2.setRank(this.data[_arg_1]);
         }
      }
      
      public function remove(_arg_1:String) : void
      {
         delete this.data[_arg_1];
      }
   }
}

