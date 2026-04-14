package projects.tanks.clients.flash.commons.services.battlelinkactivator
{
   import flash.events.Event;
   
   public class BattleLinkAliveEvent extends Event
   {
      
      public static const IS_ALIVE:String = "BattleLinkAliveEvent.IS_ALIVE";
      
      public static const ALIVE:String = "BattleLinkAliveEvent.ALIVE";
      
      public static const DEAD:String = "BattleLinkAliveEvent.DEAD";
      
      public var battleId:String;
      
      public function BattleLinkAliveEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.battleId = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

