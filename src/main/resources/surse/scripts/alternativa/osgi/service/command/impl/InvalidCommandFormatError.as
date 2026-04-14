package alternativa.osgi.service.command.impl
{
   public class InvalidCommandFormatError extends Error
   {
      
      public function InvalidCommandFormatError(_arg_1:String)
      {
         super("Command invalid format: " + _arg_1);
      }
   }
}

