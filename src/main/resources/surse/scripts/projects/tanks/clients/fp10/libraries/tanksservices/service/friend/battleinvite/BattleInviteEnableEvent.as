package projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite
{
   import flash.events.Event;
   
   public class BattleInviteEnableEvent extends Event
   {
      
      public static const UPDATE:String = "BattleInviteEnableEvent.UPDATE";
      
      public var enable:Boolean;
      
      public function BattleInviteEnableEvent(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.enable = _arg_2;
      }
   }
}

