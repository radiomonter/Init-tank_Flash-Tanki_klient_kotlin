package alternativa.tanks.controllers.battlelist
{
   import flash.events.Event;
   
   public class BattleSelectedEvent extends Event
   {
      
      public static const BATTLE_SELECTED:String = "BattleListControllerEvent.BATTLE_SELECTED";
      
      public var selectedItem:String;
      
      public function BattleSelectedEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.selectedItem = _arg_2;
      }
   }
}

