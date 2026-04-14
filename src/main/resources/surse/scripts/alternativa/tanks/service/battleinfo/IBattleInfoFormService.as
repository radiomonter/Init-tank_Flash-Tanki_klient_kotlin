package alternativa.tanks.service.battleinfo
{
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import flash.events.IEventDispatcher;
   import obfuscation.bude.BattleTeam;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public interface IBattleInfoFormService extends IEventDispatcher
   {
      
      function somodaky(param1:BattleInfoDmParams) : void;
      
      function difebab(param1:BattleInfoTeamParams) : void;
      
      function qosam() : void;
      
      function destroy() : void;
      
      function updateName(param1:String) : void;
      
      function updateTeamScore(param1:BattleTeam, param2:int) : void;
      
      function addUserTeam(param1:BattleInfoUser, param2:BattleTeam) : void;
      
      function felah(param1:BattleInfoUser) : void;
      
      function removeUser(param1:String) : void;
      
      function updateUserScore(param1:String, param2:int) : void;
      
      function updateUserSuspiciousState(param1:String, param2:Boolean) : void;
      
      function swapTeams() : void;
      
      function wavol() : void;
      
      function roundStart() : void;
      
      function roundFinish() : void;
      
      function battleStop() : void;
      
      function vamo() : void;
      
      function removeFormFromStage() : void;
      
      function getBattleItemId() : String;
      
      function qorapoha() : void;
   }
}

