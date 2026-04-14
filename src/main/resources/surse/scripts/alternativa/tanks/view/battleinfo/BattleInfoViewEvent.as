package alternativa.tanks.view.battleinfo
{
   import flash.events.Event;
   import obfuscation.bude.BattleTeam;
   
   public class BattleInfoViewEvent extends Event
   {
      
      public static const ENTER_DM:String = "BattleInfoViewEvent.ENTER_DM";
      
      public static const ENTER_SPECTATOR:String = "BattleInfoViewEvent.ENTER_SPECTATOR";
      
      public static const ENTER_TEAM:String = "BattleInfoViewEvent.ENTER_TEAM";
      
      public static const EXIT_FROM_BATTLE:String = "BattleInfoViewEvent.EXIT_FROM_BATTLE";
      
      public static const RETURN_TO_BATTLE:String = "BattleInfoViewEvent.RETURN_TO_BATTLE";
      
      public var team:BattleTeam;
      
      public function BattleInfoViewEvent(_arg_1:String, _arg_2:BattleTeam = null, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.team = _arg_2;
      }
      
      override public function clone() : Event
      {
         return new BattleInfoViewEvent(type,this.team,bubbles,cancelable);
      }
   }
}

