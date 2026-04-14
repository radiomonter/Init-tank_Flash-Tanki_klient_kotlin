package alternativa.tanks.services.targeting
{
   public interface TargetingInputManager
   {
      
      function init() : void;
      
      function close() : void;
      
      function tick() : void;
      
      function addListener(param1:Qizytyv) : void;
      
      function removeListener(param1:Qizytyv) : void;
      
      function lyregejiv() : void;
      
      function nizojemak() : void;
      
      function volof() : void;
      
      function requestMouseLock() : void;
      
      function res() : void;
      
      function tiq(param1:int = 1) : void;
   }
}

