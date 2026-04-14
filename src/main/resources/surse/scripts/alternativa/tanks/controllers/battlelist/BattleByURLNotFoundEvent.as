package alternativa.tanks.controllers.battlelist
{
   import flash.events.Event;
   
   public class BattleByURLNotFoundEvent extends Event
   {
      
      public static const BATTLE_BY_URL_NOT_FOUND:String = "BattleListControllerEvent.BATTLE_BY_URL_NOT_FOUND";
      
      public var battleId:String;
      
      public function BattleByURLNotFoundEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.battleId = _arg_2;
      }
   }
}

