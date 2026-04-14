package alternativa.tanks.models.tank.spawn
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Pipujic implements LogicUnit
   {
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var tankObject:IGameObject;
      
      private var endTime:int;
      
      public function Pipujic(_arg_1:int, _arg_2:IGameObject)
      {
         super();
         this.tankObject = _arg_2;
         this.endTime = getTimer() + _arg_1;
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(_arg_1 >= this.endTime && !lobbyLayoutService.isWindowOpenOverBattle() && !lobbyLayoutService.isSwitchInProgress())
         {
            TankModel(OSGi.getInstance().getService(ITankModel)).setReadyToPlace();
         }
      }
      
      public function kic(_arg_1:IGameObject) : void
      {
         this.tankObject = _arg_1;
      }
   }
}

