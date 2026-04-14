package alternativa.tanks.service
{
   public interface AccountService
   {
      
      function get bylige() : Boolean;
      
      function set bylige(param1:Boolean) : void;
      
      function get bylitef() : String;
      
      function set bylitef(param1:String) : void;
      
      function get entranceHash() : String;
   }
}

