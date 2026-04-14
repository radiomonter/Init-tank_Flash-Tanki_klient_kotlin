package fominskiy.server.models.premium
{
   import flash.events.Event;
   
   public class ChangeUserPremiumStatus extends Event
   {
      
      public static const CHANGE:String = "CHANGE_USER_PREMIUM_STATUS";
      
      public var nickname:String;
      
      public var premium:Boolean;
      
      public function ChangeUserPremiumStatus(_arg_1:String, _arg_2:String, _arg_3:Boolean)
      {
         super(_arg_1,false,false);
         this.nickname = _arg_2;
         this.premium = _arg_3;
      }
   }
}

