package alternativa.tanks.models.battle.battlefield
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public interface BattleUserInfoService
   {
      
      function kiq(param1:String) : String;
      
      function fotoqasy(param1:String) : int;
      
      function suwiq(param1:String) : Boolean;
      
      function dijolycy(param1:String) : ChatModeratorLevel;
      
      function fugireza(param1:BattleUserInfoListener) : void;
      
      function pucuke(param1:BattleUserInfoListener) : void;
   }
}

