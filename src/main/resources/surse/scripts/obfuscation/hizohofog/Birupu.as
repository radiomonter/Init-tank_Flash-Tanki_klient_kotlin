package obfuscation.hizohofog
{
   import obfuscation.bude.BattleTeam;
   import obfuscation.kofen.Vector3d;
   
   public interface Birupu
   {
      
      function dropFlag(param1:Vector3d, param2:BattleTeam) : void;
      
      function flagDelivered(param1:BattleTeam, param2:String) : void;
      
      function flagTaken(param1:String, param2:BattleTeam) : void;
      
      function returnFlagToBase(param1:BattleTeam, param2:String) : void;
   }
}

