package alternativa.tanks.service.money
{
   public interface IMoneyService
   {
      
      function addListener(param1:Kyfa) : void;
      
      function removeListener(param1:Kyfa) : void;
      
      function get crystal() : int;
      
      function init(param1:int) : void;
      
      function sym(param1:int) : void;
      
      function dic(param1:int) : Boolean;
      
      function wuc(param1:int) : void;
   }
}

