package alternativa.osgi.service.console
{
   public class ConsoleVarChangeError extends Error
   {
      
      public function ConsoleVarChangeError(_arg_1:String, _arg_2:String, _arg_3:String)
      {
         super("Can not change variable " + _arg_1 + ", value=" + _arg_2 + ", message=" + _arg_3);
      }
   }
}

