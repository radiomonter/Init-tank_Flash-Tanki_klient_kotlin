package alternativa.tanks.service.settings.keybinding
{
   import flash.events.IEventDispatcher;
   
   public interface KeysBindingService extends IEventDispatcher
   {
      
      function dowep(param1:uint) : Boolean;
      
      function rof(param1:GameActionEnum, param2:uint, param3:int) : Boolean;
      
      function jikamybu(param1:uint) : GameActionEnum;
      
      function ketucuk(param1:GameActionEnum, param2:uint) : uint;
      
      function pyrydere(param1:GameActionEnum) : Vector.<uint>;
      
      function rekomatow() : void;
      
      function zicovuqo(param1:uint) : String;
   }
}

