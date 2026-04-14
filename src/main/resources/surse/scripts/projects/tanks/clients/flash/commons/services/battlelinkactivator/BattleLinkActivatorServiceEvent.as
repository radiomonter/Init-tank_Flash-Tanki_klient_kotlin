package projects.tanks.clients.flash.commons.services.battlelinkactivator
{
   import flash.events.Event;
   
   public class BattleLinkActivatorServiceEvent extends Event
   {
      
      public static const ACTIVATE_LINK:String = "BattleLinkActivatorServiceEvent.ACTIVATE_LINK";
      
      public static const CONFIRMED_NAVIGATE:String = "BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE";
      
      public static const NOT_CONFIRMED_NAVIGATE:String = "BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE";
      
      public var link:String;
      
      public function BattleLinkActivatorServiceEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.link = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

