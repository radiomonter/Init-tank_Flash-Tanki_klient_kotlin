package fominskiy.server.models.premium
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   
   public class BattlePremiumService extends EventDispatcher implements IBattlePremiumService
   {
      
      private var premiumUsersData:Dictionary = new Dictionary();
      
      public function BattlePremiumService()
      {
         super();
      }
      
      public function init(_arg_1:Array) : void
      {
         var _local_2:String = null;
         for each(_local_2 in _arg_1)
         {
            this.premiumUsersData[_local_2] = true;
            dispatchEvent(new ChangeUserPremiumStatus(ChangeUserPremiumStatus.CHANGE,_local_2,true));
         }
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_RANK));
      }
      
      public function clear() : void
      {
         this.premiumUsersData = new Dictionary();
      }
      
      public function hasUserPremium(_arg_1:String) : Boolean
      {
         return this.premiumUsersData[_arg_1];
      }
   }
}

