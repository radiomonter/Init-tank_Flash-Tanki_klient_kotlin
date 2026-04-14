package alternativa.osgi.service.command.impl
{
   public class CommandNotFoundError extends Error
   {
      
      public function CommandNotFoundError(_arg_1:String, _arg_2:String)
      {
         super(this.createMessage(_arg_1,_arg_2));
      }
      
      private function createMessage(_arg_1:String, _arg_2:String) : String
      {
         var _local_3:String = "Command not found: " + _arg_1;
         if(_arg_2 != null)
         {
            _local_3 += "\n" + _arg_2;
         }
         return _local_3;
      }
   }
}

