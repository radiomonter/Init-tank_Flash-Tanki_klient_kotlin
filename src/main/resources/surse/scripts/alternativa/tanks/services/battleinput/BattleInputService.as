package alternativa.tanks.services.battleinput
{
   import flash.events.IEventDispatcher;
   
   public interface BattleInputService extends IEventDispatcher
   {
      
      function lock(param1:Tyd) : void;
      
      function unlock(param1:Tyd) : void;
      
      function miwyraze() : Boolean;
      
      function jep() : Boolean;
   }
}

