package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium
{
   import alternativa.osgi.OSGi;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.tanksservices.model.notifier.premium.IPremiumNotifierModelBase;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class PremiumNotifierModel extends PremiumNotifierModelBase implements IPremiumNotifierModelBase, UserRefresh, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      private const DAY_IN_SECONDS:int = 86400;
      
      private var data:Dictionary;
      
      private var timeouts:Dictionary;
      
      public function PremiumNotifierModel()
      {
         super();
      }
      
      public function updateTimeLeft(_arg_1:int) : void
      {
         premiumService.updateTimeLeft(_arg_1);
      }
      
      public function objectLoaded() : void
      {
         this.data = new Dictionary();
         this.timeouts = new Dictionary();
         premiumService.updateTimeLeft(getInitParam().lifeTimeInSeconds);
         premiumService.addEventListener(Event.CHANGE,this.onSelfPremiumChange);
      }
      
      private function onSelfPremiumChange(_arg_1:Event) : void
      {
         this.updateForAllNotifiers(userPropertiesService.userId,premiumService.hasPremium());
      }
      
      public function objectUnloaded() : void
      {
         var _local_1:uint = 0;
         for each(_local_1 in this.timeouts)
         {
            clearTimeout(_local_1);
         }
         this.timeouts = null;
         this.data = null;
         premiumService.removeEventListener(Event.CHANGE,this.onSelfPremiumChange);
         premiumService.destroy();
      }
      
      public function setPremiumTimeLeft(_arg_1:Vector.<PremiumNotifierData>) : void
      {
         var _local_2:PremiumNotifierData = null;
         for each(_local_2 in _arg_1)
         {
            this.setAndUpdate(_local_2);
         }
      }
      
      private function setAndUpdate(_arg_1:PremiumNotifierData) : void
      {
         var _local_2:int = 0;
         var _local_3:String = _arg_1.userId;
         var _local_4:* = _arg_1.premiumTimeLeftInSeconds > 0;
         if(Boolean(_local_4) && _local_3 in this.data)
         {
            return;
         }
         if(Boolean(_local_4) && _arg_1.premiumTimeLeftInSeconds < this.DAY_IN_SECONDS)
         {
            _local_2 = _arg_1.premiumTimeLeftInSeconds * 1000 + getTimer();
            this.timeouts[_local_3] = setTimeout(this.removePremium,_arg_1.premiumTimeLeftInSeconds * 1000,_local_3);
         }
         else
         {
            _local_2 = this.DAY_IN_SECONDS * 1000 + getTimer();
         }
         if(Boolean(_local_4))
         {
            this.data[_local_3] = _local_2;
         }
         else
         {
            this.remove(_local_3);
         }
         this.updateForAllNotifiers(_local_3,_local_4);
      }
      
      private function updateForAllNotifiers(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:UserInfoConsumer = null;
         var _local_4:UserNotifier = UserNotifier(OSGi.getInstance().getService(UserNotifier));
         if(_local_4.hasDataConsumer(_arg_1))
         {
            _local_3 = _local_4.getDataConsumer(_arg_1);
            _local_3.setPremium(_arg_2,_arg_1);
         }
      }
      
      private function removePremium(_arg_1:String) : void
      {
         this.updateForAllNotifiers(_arg_1,false);
         this.remove(_arg_1);
      }
      
      public function refresh(_arg_1:String, _arg_2:UserInfoConsumer) : void
      {
         if(_arg_1 in this.data)
         {
            _arg_2.setPremium(getTimer() < this.data[_arg_1]);
         }
      }
      
      public function remove(_arg_1:String) : void
      {
         if(_arg_1 in this.timeouts)
         {
            clearTimeout(this.timeouts[_arg_1]);
            delete this.timeouts[_arg_1];
         }
         delete this.data[_arg_1];
      }
   }
}

