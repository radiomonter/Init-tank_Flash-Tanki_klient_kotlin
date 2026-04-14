package obfuscation.bopo
{
   import obfuscation.bude.BattleTeam;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public interface Degah
   {
      
      function addUser(param1:BattleInfoUser, param2:BattleTeam) : void;
      
      function pevuje() : void;
      
      function swapTeams() : void;
      
      function updateTeamScore(param1:BattleTeam, param2:int) : void;
      
      function updateUserScore(param1:String, param2:int) : void;
   }
}

