package alternativa.tanks.service.battlelist
{
   import flash.events.IEventDispatcher;
   import platform.client.fp10.core.type.IGameObject;
   
   public interface IBattleListFormService extends IEventDispatcher
   {
      
      function sevop() : void;
      
      function kaso() : void;
      
      function battleItemRecord(param1:IGameObject) : void;
      
      function weqogos(param1:String) : void;
      
      function selectBattleItemFromServer(param1:String) : void;
      
      function updateName(param1:String, param2:String) : void;
      
      function madePrivate(param1:String, param2:String) : void;
      
      function updateSuspicious(param1:String, param2:Boolean) : void;
      
      function updateUsersCountTeam(param1:String, param2:int, param3:int, param4:int, param5:int) : void;
      
      function updateUsersCountDm(param1:String, param2:int, param3:int) : void;
      
      function swapTeams(param1:String) : void;
      
      function battleItemsPacketJoinSuccess() : void;
   }
}

