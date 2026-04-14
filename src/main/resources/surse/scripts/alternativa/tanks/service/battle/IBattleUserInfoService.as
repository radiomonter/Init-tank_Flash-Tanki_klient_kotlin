package alternativa.tanks.service.battle
{
   import platform.client.fp10.core.type.IGameObject;
   
   public interface IBattleUserInfoService
   {
      
      function debet(param1:String) : IGameObject;
      
      function connect(param1:String, param2:IGameObject) : void;
      
      function disconnect(param1:String) : void;
      
      function fitaqo(param1:String) : Boolean;
      
      function tofawa(param1:IGameObject) : void;
   }
}

