package projects.tanks.clients.fp10.libraries.tanksservices.service.user
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.TimeOutTruncateConsumers;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   
   public class UserInfoService extends EventDispatcher implements IUserInfoService
   {
      
      [Inject]
      public static var premiumService:PremiumService;
      
      private var consumers:Dictionary;
      
      private var unsubscribedConsumers:Dictionary;
      
      private var truncateConsumers:TimeOutTruncateConsumers;
      
      public function UserInfoService()
      {
         super();
      }
      
      public function init() : void
      {
         this.truncateConsumers = new TimeOutTruncateConsumers();
         this.truncateConsumers.consumers = this.consumers;
         this.truncateConsumers.truncateFunction = this.unSubscribe;
         this.consumers = new Dictionary();
         this.unsubscribedConsumers = new Dictionary();
      }
      
      public function getOrCreateUpdater(_arg_1:String) : IUserInfoLabelUpdater
      {
         var _local_2:UserInfoLabelUpdater = null;
         if(this.hasConsumer(_arg_1))
         {
            _local_2 = this.consumers[_arg_1];
         }
         else
         {
            _local_2 = new UserInfoLabelUpdater();
            _local_2.setUid(_arg_1);
            if(_arg_1 in this.unsubscribedConsumers)
            {
               this.subscribe(_arg_1,_local_2);
            }
            else
            {
               this.refresh(_arg_1,_local_2);
            }
            this.subscribe(_arg_1,_local_2);
         }
         _local_2.updateLastAccessTime();
         return _local_2;
      }
      
      public function forciblySubscribe(_arg_1:String) : void
      {
         var _local_2:UserInfoLabelUpdater = null;
         if(!this.hasConsumer(_arg_1))
         {
            _local_2 = new UserInfoLabelUpdater();
            _local_2.setUid(_arg_1);
            this.subscribe(_arg_1,_local_2);
            _local_2.updateLastAccessTime();
         }
      }
      
      private function subscribe(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         delete this.unsubscribedConsumers[_arg_1];
         this.consumers[_arg_1] = _arg_2;
         UserNotifier(OSGi.getInstance().getService(UserNotifier)).subcribe(_arg_1,_arg_2);
      }
      
      private function refresh(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         this.consumers[_arg_1] = _arg_2;
         UserNotifier(OSGi.getInstance().getService(UserNotifier)).refresh(_arg_1,_arg_2);
      }
      
      private function unSubscribe(_arg_1:Vector.<String>) : void
      {
         var _local_2:Long = null;
         for each(_local_2 in _arg_1)
         {
            this.unsubscribedConsumers[_local_2] = true;
            delete this.consumers[_local_2];
         }
         UserNotifier(OSGi.getInstance().getService(UserNotifier)).unsubcribe(_arg_1);
      }
      
      public function hasConsumer(_arg_1:String) : Boolean
      {
         return _arg_1 in this.consumers;
      }
      
      public function getConsumer(_arg_1:String) : UserInfoConsumer
      {
         return this.consumers[_arg_1];
      }
      
      public function unload() : void
      {
         this.truncateConsumers.stop();
         this.truncateConsumers = null;
         this.consumers = null;
         this.unsubscribedConsumers = null;
      }
      
      public function getCurrentUserId() : String
      {
         return UserNotifier(OSGi.getInstance().getService(UserNotifier)).getCurrentUserId();
      }
      
      public function hasPremium(_arg_1:String) : Boolean
      {
         return this.getOrCreateUpdater(_arg_1).hasPremium();
      }
   }
}

