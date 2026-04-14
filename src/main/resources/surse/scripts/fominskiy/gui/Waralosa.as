package fominskiy.gui
{
   import platform.client.fp10.core.service.errormessage.errors.ErrorType;
   
   public class Waralosa implements ErrorType
   {
      
      private var message:String;
      
      public function Waralosa(_arg_1:String)
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

