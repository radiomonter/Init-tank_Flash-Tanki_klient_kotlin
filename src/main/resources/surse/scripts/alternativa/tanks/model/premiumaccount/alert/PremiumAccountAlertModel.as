package alternativa.tanks.model.premiumaccount.alert
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.premiumaccount.PremiumAccountWelcomeAlert;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.model.premiumaccount.notification.PremiumCompleteNotification;
   import flash.events.Event;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import projects.tanks.client.panel.model.premiumaccount.alert.PremiumAccountAlertCC;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   
   public class PremiumAccountAlertModel
   {
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const UPDATE_INTERVAL:int = 60000;
      
      private var _showReminderIntervalId:uint = 0;
      
      private var _wasShowReminderCompletionPremium:Boolean;
      
      private var _reminderCompletionPremiumTime:int;
      
      public function PremiumAccountAlertModel()
      {
         super();
      }
      
      public function objectLoaded(_arg_1:PremiumAccountAlertCC) : void
      {
         var _local_2:PremiumAccountAlertCC = _arg_1;
         if(_local_2.localRuntimeUser)
         {
            if(_local_2.needShowWelcomeAlert)
            {
               this.showWelcomeAlert(_local_2.wasShowAlertForFirstPurchasePremium);
            }
            if(_local_2.needShowNotificationCompletionPremium)
            {
               this.showNotificationCompletionPremium();
            }
            this._wasShowReminderCompletionPremium = _local_2.wasShowReminderCompletionPremium;
            this._reminderCompletionPremiumTime = _local_2.reminderCompletionPremiumTime;
            this.checkNeedShowReminderCompletionPremium();
            premiumService.addEventListener(Event.CHANGE,this.onSelfPremiumChange);
         }
      }
      
      private function checkNeedShowReminderCompletionPremium() : void
      {
         var _local_1:int = 0;
         this.destroyReminderInterval();
         if(premiumService.hasPremium())
         {
            _local_1 = premiumService.getTimeLeft() - this._reminderCompletionPremiumTime;
            if(_local_1 > 0)
            {
               this._wasShowReminderCompletionPremium = false;
               this._showReminderIntervalId = setInterval(this.checkNeedShowReminderCompletionPremium,UPDATE_INTERVAL);
            }
            else if(!this._wasShowReminderCompletionPremium)
            {
               this.showReminderCompletionPremium();
            }
         }
      }
      
      public function objectUnloaded() : void
      {
         premiumService.removeEventListener(Event.CHANGE,this.onSelfPremiumChange);
         this.destroyReminderInterval();
      }
      
      private function destroyReminderInterval() : void
      {
         if(this._showReminderIntervalId != 0)
         {
            clearInterval(this._showReminderIntervalId);
            this._showReminderIntervalId = 0;
         }
      }
      
      public function showWelcomeAlert(_arg_1:Boolean) : void
      {
         var _local_2:String = null;
         if(_arg_1)
         {
            _local_2 = localeService.getText(TextConst.TEXT_PREMIUM_ALERT_RETURN);
         }
         else
         {
            _local_2 = localeService.getText(TextConst.TEXT_PREMIUM_ALERT_WELCOM);
         }
         var _local_3:PremiumAccountWelcomeAlert = new PremiumAccountWelcomeAlert(_local_2);
         _local_3.enqueueDialog();
      }
      
      private function onSelfPremiumChange(_arg_1:Event) : void
      {
         if(premiumService.hasPremium())
         {
            this.checkNeedShowReminderCompletionPremium();
         }
         else
         {
            this.showNotificationCompletionPremium();
         }
      }
      
      private function showNotificationCompletionPremium() : void
      {
         notificationService.addNotification(new PremiumCompleteNotification(localeService.getText(TextConst.TEXT_PREMIUM_NOTIFICATION_COMPLETE)));
      }
      
      private function showReminderCompletionPremium() : void
      {
         this._wasShowReminderCompletionPremium = true;
         notificationService.addNotification(new PremiumCompleteNotification(localeService.getText(TextConst.TEXT_PREMIUM_NOTIFICATION_SOON_COMPLETE)));
      }
   }
}

