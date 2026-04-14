package platform.client.fp10.core.service.errormessage.errors
{
   public class UnclassifyedError implements ErrorType
   {
      
      private var message:String;
      
      public function UnclassifyedError(_arg_1:String)
      {
         super();
         this.message = _arg_1;
      }
      
      public function getMessage() : String
      {
         return this.message;
      }
   }
}

