package projects.tanks.client.panel.model.premiumaccount.alert
{
   public class PremiumAccountAlertCC
   {
      
      private var _localRuntimeUser:Boolean;
      
      private var _needShowNotificationCompletionPremium:Boolean;
      
      private var _needShowWelcomeAlert:Boolean;
      
      private var _reminderCompletionPremiumTime:Number;
      
      private var _wasShowAlertForFirstPurchasePremium:Boolean;
      
      private var _wasShowReminderCompletionPremium:Boolean;
      
      public function PremiumAccountAlertCC(_arg_1:Boolean = false, _arg_2:Boolean = false, _arg_3:Boolean = false, _arg_4:Number = 0, _arg_5:Boolean = false, _arg_6:Boolean = false)
      {
         super();
         this._localRuntimeUser = _arg_1;
         this._needShowNotificationCompletionPremium = _arg_2;
         this._needShowWelcomeAlert = _arg_3;
         this._reminderCompletionPremiumTime = _arg_4;
         this._wasShowAlertForFirstPurchasePremium = _arg_5;
         this._wasShowReminderCompletionPremium = _arg_6;
      }
      
      public function get localRuntimeUser() : Boolean
      {
         return this._localRuntimeUser;
      }
      
      public function set localRuntimeUser(_arg_1:Boolean) : void
      {
         this._localRuntimeUser = _arg_1;
      }
      
      public function get needShowNotificationCompletionPremium() : Boolean
      {
         return this._needShowNotificationCompletionPremium;
      }
      
      public function set needShowNotificationCompletionPremium(_arg_1:Boolean) : void
      {
         this._needShowNotificationCompletionPremium = _arg_1;
      }
      
      public function get needShowWelcomeAlert() : Boolean
      {
         return this._needShowWelcomeAlert;
      }
      
      public function set needShowWelcomeAlert(_arg_1:Boolean) : void
      {
         this._needShowWelcomeAlert = _arg_1;
      }
      
      public function get reminderCompletionPremiumTime() : Number
      {
         return this._reminderCompletionPremiumTime;
      }
      
      public function set reminderCompletionPremiumTime(_arg_1:Number) : void
      {
         this._reminderCompletionPremiumTime = _arg_1;
      }
      
      public function get wasShowAlertForFirstPurchasePremium() : Boolean
      {
         return this._wasShowAlertForFirstPurchasePremium;
      }
      
      public function set wasShowAlertForFirstPurchasePremium(_arg_1:Boolean) : void
      {
         this._wasShowAlertForFirstPurchasePremium = _arg_1;
      }
      
      public function get wasShowReminderCompletionPremium() : Boolean
      {
         return this._wasShowReminderCompletionPremium;
      }
      
      public function set wasShowReminderCompletionPremium(_arg_1:Boolean) : void
      {
         this._wasShowReminderCompletionPremium = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "PremiumAccountAlertCC [";
         _local_1 += "localRuntimeUser = " + this.localRuntimeUser + " ";
         _local_1 += "needShowNotificationCompletionPremium = " + this.needShowNotificationCompletionPremium + " ";
         _local_1 += "needShowWelcomeAlert = " + this.needShowWelcomeAlert + " ";
         _local_1 += "reminderCompletionPremiumTime = " + this.reminderCompletionPremiumTime + " ";
         _local_1 += "wasShowAlertForFirstPurchasePremium = " + this.wasShowAlertForFirstPurchasePremium + " ";
         _local_1 += "wasShowReminderCompletionPremium = " + this.wasShowReminderCompletionPremium + " ";
         return _local_1 + "]";
      }
   }
}

