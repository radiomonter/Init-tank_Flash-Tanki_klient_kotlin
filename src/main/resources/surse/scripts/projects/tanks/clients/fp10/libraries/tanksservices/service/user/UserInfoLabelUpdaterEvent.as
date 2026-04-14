package projects.tanks.clients.fp10.libraries.tanksservices.service.user
{
   import flash.events.Event;
   
   public class UserInfoLabelUpdaterEvent extends Event
   {
      
      public static const CHANGE_RANK:String = "UserLabelUpdaterEvent.CHANGE_RANK";
      
      public static const CHANGE_UID:String = "UserLabelUpdaterEvent.CHANGE_UID";
      
      public static const CHANGE_ONLINE:String = "UserLabelUpdaterEvent.CHANGE_STATUS";
      
      public static const CHANGE_BATTLE_LINK:String = "UserLabelUpdaterEvent.CHANGE_BATTLE_LINK";
      
      public static const CHANGE_PREMIUM_STATUS:String = "UserLabelUpdaterEvent.CHANGE_PREMIUM_STATUS";
      
      public var premium:Boolean;
      
      public var user:String;
      
      public function UserInfoLabelUpdaterEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false, _arg_4:Boolean = false, _arg_5:String = null)
      {
         super(_arg_1,_arg_2,_arg_3);
         this.premium = _arg_4;
         this.user = _arg_5;
      }
   }
}

