package alternativa.osgi.service.console
{
   public class ConsoleVarNotFoundError extends Error
   {
      
      public function ConsoleVarNotFoundError(_arg_1:String)
      {
         super("Console var not found: " + _arg_1);
      }
   }
}

