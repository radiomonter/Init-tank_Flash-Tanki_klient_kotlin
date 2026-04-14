package alternativa.tanks.services.battlegui
{
   import flash.events.Event;
   
   public class BattleGUIServiceEvent extends Event
   {
      
      public static const ON_CHANGE_POSITION_DEFAULT_LAYOUT:String = "BattleGUIServiceEvent.ON_CHANGE_POSITION_DEFAULT_LAYOUT";
      
      public function BattleGUIServiceEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

