package platform.client.fp10.core.service.errormessage.errors
{
   import platform.client.fp10.core.resource.Resource;
   
   public class ResourceError implements ErrorType
   {
      
      private var resource:Resource;
      
      private var errorText:String;
      
      public function ResourceError(_arg_1:Resource, _arg_2:String)
      {
         super();
         this.errorText = _arg_2;
         this.resource = _arg_1;
      }
      
      public function getMessage() : String
      {
         return "Fatal error. Resource id: " + this.resource.id + ", resource version: " + this.resource.version + " " + this.errorText + " " + this.resource.getBaseUrl();
      }
   }
}

