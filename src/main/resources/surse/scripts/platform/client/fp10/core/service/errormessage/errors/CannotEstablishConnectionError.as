package platform.client.fp10.core.service.errormessage.errors
{
   public class CannotEstablishConnectionError implements ErrorType
   {
      
      private var host:String;
      
      private var ports:Vector.<int>;
      
      public function CannotEstablishConnectionError(_arg_1:String, _arg_2:Vector.<int>)
      {
         super();
         this.host = _arg_1;
         this.ports = _arg_2;
      }
      
      public function getMessage() : String
      {
         return "Cannot establish connection (host: " + this.host + ", ports: " + this.ports + ")";
      }
   }
}

