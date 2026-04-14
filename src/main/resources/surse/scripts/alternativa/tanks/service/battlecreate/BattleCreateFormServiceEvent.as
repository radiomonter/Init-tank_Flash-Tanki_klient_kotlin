package alternativa.tanks.service.battlecreate
{
   import flash.events.Event;
   
   public class BattleCreateFormServiceEvent extends Event
   {
      
      public static const SHOW_FORM:String = "BattleCreateFormServiceEvent.SHOW_FORM";
      
      public static const HIDE_FORM:String = "BattleCreateFormServiceEvent.HIDE_FORM";
      
      public function BattleCreateFormServiceEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

