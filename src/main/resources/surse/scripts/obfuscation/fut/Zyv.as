package obfuscation.fut
{
   import obfuscation.bude.BattleTeam;
   
   public interface Zyv
   {
      
      function onReleaseSlot(param1:String) : void;
      
      function onReserveSlot(param1:String, param2:BattleTeam) : void;
      
      function swapTeams() : void;
   }
}

